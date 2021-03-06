class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protect_from_forgery with: :exception
  before_filter :set_cache_headers

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
    
    def record_not_found
        render plain: "URL Invalid: Stop trying to break my code =D", status: 404
    end

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "expires_now()"
  end  
end
