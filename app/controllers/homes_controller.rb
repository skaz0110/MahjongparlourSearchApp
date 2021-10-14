class HomesController < ApplicationController
  # YoutubeAPIでMリーグの動画を表示
  require 'google/apis/youtube_v3'
  require 'active_support/all'

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['GOOGLE_API_KEY']

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 1,
      # order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }

    # TODO: 表示容量オーバーのためyoutbe動画は一時非表示
    # service.list_searches(:snippet, opt)
  end

  # 1ページの表示数
  PER_PAGE = 6

  def index
    # ページネーション
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).order(created_at: :desc).per(PER_PAGE)

    # 動画を取得
    @youtube_data = find_videos('M.LEAGUE [プロ麻雀リーグ]')

    # 最新のコメントとレビューを５件ずつ取得
    @comments = Comment.all.order(id: 'DESC').limit(5)
    @reviews = Review.all.order(id: 'DESC').limit(5)

    # スクレイピング
    agent = Mechanize.new
    agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    page = agent.get('https://jan39.com/news/')

    # ニュースを３件取得
    @firstnews  = page.links[88]
    @secondnews = page.links[92]
    @thirdnews  = page.links[97]
  end
end
