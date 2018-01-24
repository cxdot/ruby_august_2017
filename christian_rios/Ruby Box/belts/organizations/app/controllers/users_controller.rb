class UsersController < ApplicationController
  
    def create
        @user = User.new(user_params)
        
        if @user.save
            flash[:notice] = ["Registered successfully"]

            session[:user_id] = @user.id 
            return redirect_to action: "index", :controller => "groups"
        end

        errors = @user.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password)
        end
end
