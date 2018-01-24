class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  def register
  end

  def current_user
    return Debitor.find(session[:debitor_id]) if session[:debitor_id]
    return Creditor.find(session[:creditor_id]) if session[:creditor_id]
  end

  helper_method :current_user
end
