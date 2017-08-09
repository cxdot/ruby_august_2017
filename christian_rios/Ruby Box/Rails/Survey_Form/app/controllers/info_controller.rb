class InfoController < ApplicationController
  def index
    session[:count] ||= 0
  end

  def create
    session[:info] = params[:info]
    flash[:success] = "Thanks for submitting this form! You have submitted this form #{session[:count] +=1} times now."
    redirect_to '/results'
  end

  def results
    @info = session[:info]
  end

  private
    def info_params
      params.require(:info).permit(:name, :location, :language, :comment)
    end
end
