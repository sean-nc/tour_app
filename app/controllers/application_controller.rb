class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def logged_in?
      unless user_signed_in?
        flash[:danger] = "Please log in."
        redirect_to new_user_session_path
      end
    end
end
