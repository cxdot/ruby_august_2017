class UsersController < ApplicationController
    before_action :require_login, except: [:create]

    def create
        @user = User.new(user_params)
        
        if @user.save
                flash[:notice] = ["Registered successfully"]

                session[:user_id] = @user.id 
            return redirect_to ideas_path
        end

        errors = @user.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    def show
        @user = User.find(params[:id])
        if @user
            return render 'show'
        else
            return redirect_to :back
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end

end
