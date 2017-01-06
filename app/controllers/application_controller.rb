class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?


  private

  def authenticate_user
    if !logged_in?
      flash[:notice] = 'You must be logged in to view this'
      redirect_to root_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

end
