class ApplicationController < ActionController::Base

  before_action :require_login
  skip_before_action :require_login, only: [:index]

  protect_from_forgery with: :exception

  def index 
  end

  def current_user
    return User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  private 
    def require_login
      return redirect_to root_path unless session[:user_id] 
    end
    
end
