class PostsController < ApplicationController
  before_action :set_postsearch
  before_action :login_check, only: %i[new update edit create]
  PER_PAGE = 10

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path, notice: '更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      #　コメント送信後は、一つ前のページへリダイレクトさせる。
      redirect_to post_path(@post), notice: '店舗を登録しました'
    else
      flash.now[:alert] = '店舗の登録に失敗しました'
      #　コメント送信後は、一つ前のページへリダイレクトさせる。
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :title, :address1, :address2, :address3, :postalcode, :prefecturecode,
                                 :phonenumber, :access, :openinghours, :regularholiday, :gamefree, :gameset)
  end

  def set_postsearch
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(PER_PAGE)
  end
end
