class UsersController < ApplicationController
    before_action :require_login, only: [:index, :show]

    def create
        @user = User.new(user_params)
        
        if @user.save
            flash[:notice] = ["Registered successfully"]

            session[:user_id] = @user.id 
            return redirect_to action: "show", id: @user.id
        end

        errors = @user.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    def show
        @user = current_user
        @shoes = Kickz.where("user_id = ?", @user.id)
        @spent = Kickz.joins(:user).where(["user_id = ? and sold = ?", @user, true]).sum(:amount)
        @sold = Transaction.where("user_id = ?", @user.id)
        @profit = Transaction.where("user_id = ?", @user.id).sum(:amount)
        p @profit
        @purchased = Transaction.where("kickz_id = ?", @user.id)
    end 

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password)
        end

end
