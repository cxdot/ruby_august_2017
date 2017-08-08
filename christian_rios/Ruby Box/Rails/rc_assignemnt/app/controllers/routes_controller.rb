class RoutesController < ApplicationController
  def index
  end

  def hello
    render text: "Hello Coding Dojo"
  end

  def holla
    if params[:name] == "michael"
      redirect_to "/say/hello/joe"
    else
    render text: "Saying Hello Joe!"
    end
  end

  def visits
    session[:count] ||= 0
    render text: "You have visited this page #{session[:count] += 1} times."
  end

  def restart
    reset_session
    render text: "Destroyed the session!"
  end
end
