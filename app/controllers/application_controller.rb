class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user_session!
    unless current_user
      flash[:notice] = "Hey there, please make sure to log in first."
      redirect_to new_session_url
      return false
    end
  end

  helper_method :current_user

end
