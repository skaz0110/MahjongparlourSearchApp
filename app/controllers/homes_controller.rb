class HomesController < ApplicationController
  def index
    @posts = Post.all
    @comment = Comment.new
    @comments = Comment.all
    
  end

  def show
      
    @post = Post.find(params[:id])
    @comments = Comment.order(:id)
    @shopdetails = ShopDetail.order(:id)
    if user_signed_in?
      
    else
      redirect_to user_session_path
    end
  end
  
  def create
    @comment = Comment.new(comment_params)
  end
  

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.name = "ゲストユーザー"
  end
    sign_in user
    
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
