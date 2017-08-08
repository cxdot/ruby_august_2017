class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
    render "users/new"
  end

  def create
  @user = User.create(name: params[:name])
  redirect_to "/users"
  end

  def show
    if User.exists?params[:id]
      render json: User.find(params[:id])
    else
      render text: "User doesn't exist."
    end
  end

  def edit
    if User.exists?params[:id]
    @user = User.find(params[:id])
    else
      render text: "User not found"
    end
  end

  def total
    total = User.all.length
    render text: "Total number of users: #{total}"
  end

  def edit_user
    if User.exists?params[:id]
      @user = User.find(params[:id])
      @user.update(name: params[:name])
      redirect_to "/users"
    end
  end

end
