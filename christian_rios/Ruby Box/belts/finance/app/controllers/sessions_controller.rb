class SessionsController < ApplicationController
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

        @debitor = Debitor.find_by_email(params[:email])
        @creditor = Creditor.find_by_email(params[:email])
        if @debitor
            if @debitor.try(:authenticate, params[:password])
                session[:debitor_id] = @debitor.id

                return redirect_to debitors_path
            end
            
        elsif @creditor
            if @creditor.try(:authenticate, params[:password])
                session[:creditor_id] = @creditor.id

                return redirect_to creditors_path
            end
        end
        flash[:errors] = ["Email Account or Password not valid"]
        return redirect_to :back
    end

    def destroy
        session.clear

        return redirect_to root_path
    end
end
