class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,        keys: [:username,:image])
      devise_parameter_sanitizer.permit(:sign_in,        keys: [:username,:image])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username,:image])
    end

    def set_search
      @q = Post.ransack(params[:q])
    end

    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to new_user_session_path
      end
    end
    
end