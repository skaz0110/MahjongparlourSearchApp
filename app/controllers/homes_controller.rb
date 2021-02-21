class HomesController < ApplicationController
  
  # YoutubeAPIでMリーグの動画を表示
  require 'google/apis/youtube_v3'
  require 'active_support/all'
  
  GOOGLE_API_KEY = "AIzaSyBuG9WwRiGjDRgByGPLpjvDNdJOjm89eqk"

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = GOOGLE_API_KEY

    next_page_token = nil
    opt = {
      q: keyword,
      type: 'video',
      max_results: 2,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    service.list_searches(:snippet, opt)
  end

  # 1ページの表示数
  PER_PAGE = 9

  def index
      # ページネーション
      @q = Post.ransack(params[:q])
      @posts = @q.result.page(params[:page]).per(PER_PAGE)
      
      # 動画を取得
      @youtube_data = find_videos('Mリーグ')
  end
  
end
