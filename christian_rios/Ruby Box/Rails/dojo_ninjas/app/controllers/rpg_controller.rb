class RpgController < ApplicationController
  ENV['TZ'] = "America/Chicago"
  def index
    session[:gold] ||= 0
    @gold = session[:gold]

    @activities = session[:activities]
    session[:activities] ||= []
  end

  def gamble
    if params[:area] == "farm"
      session[:amt] = rand(10..20)
      session[:gold] += session[:amt]
    elsif params[:area] == "cave"
      session[:amt] = rand(5..10)
      session[:gold] += session[:amt]
    elsif params[:area] == "house"
      session[:amt] = rand(2..5)
      session[:gold] += session[:amt]
    elsif params[:area] == "casino"
      session[:amt] = rand(-50..50)
      session[:gold] += session[:amt]
    end

    @time = Time.now
    if session[:amt] > 0
      session[:activities] << "Earned #{session[:amt]} golds from the #{params[:area]}! (#{@time.strftime('%Y/%m/%d %l:%M %P')})"
    else
      session[:activities] << "Entered a casino and lost #{session[:amt]} golds... Ouch. (#{@time.strftime('%Y/%m/%d %l:%M %P')})"
    end
    puts session[:activities]
    redirect_to :root
  end

  def reset
    reset_session
    redirect_to :root
  end
end
