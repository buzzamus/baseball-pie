class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'You do not have permission for that action'
      redirect_to root_path
    end
  end

  def find_first_season
    seasons = Season.all
    @first_season = seasons.min_by(&:year).year
  end
end
