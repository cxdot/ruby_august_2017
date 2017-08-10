class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new

  end

  def new_dojo
    # @dojo = Dojo.create(dojo_params)
    # @errors = @dojo.errors.full_messages
    @dojo = Dojo.new(dojo_params)

    if @dojo.save
      redirect_to root_url, notice: "You have successfully created a Dojo!"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
    end

  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end

  def edit_dojo
    @dojo = Dojo.find(params[:id])
    @dojo.update(dojo_params)
    redirect_to '/'
  end

  def remove
    Dojo.find(params[:id]).destroy
    redirect_to '/'
  end

  private
    def dojo_params
       params.require(:dojo).permit(:branch, :street, :city, :state)
     end

end
