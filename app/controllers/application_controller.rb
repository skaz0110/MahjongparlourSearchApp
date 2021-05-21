class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: %i[username image])
    devise_parameter_sanitizer.permit(:sign_in,        keys: %i[username image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username image])
  end

  def set_search
    @q = Post.ransack(params[:q])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = 'ログインしてください'
      redirect_to new_user_session_path
    end
  end

  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  # rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  # def render_500
  #   render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  # end
end
