class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def create
        if params[:email] == "" && params[:password] == ""
            flash[:errors] = ["Email cannot be blank.", "Password cannot be blank."]
            return redirect_to :back
        end
        if params[:password] == ""
            flash[:errors] = ["Password cannot be blank."]
            return redirect_to :back
        end
        if params[:email] == ""
            flash[:errors] = ["Email cannot be blank."]
            return redirect_to :back
        end

        @user = User.find_by_email(params[:email])
        if @user
            if @user.try(:authenticate, params[:password])
                session[:user_id] = @user.id

                return redirect_to events_path
            end
            flash[:errors] = ["Invalid Password"]
        else
            flash[:errors] = ["Email Account not valid"]
        end
        return redirect_to :back
    end

    def destroy
        session.clear

        return redirect_to root_path
    end


end
