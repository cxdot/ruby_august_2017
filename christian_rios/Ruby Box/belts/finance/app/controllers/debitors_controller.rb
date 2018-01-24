class DebitorsController < ApplicationController

    def index
        @debitor = current_user
        @loans = Institution.joins(:creditor).where("institutions.debitor_id = ?", @debitor).select("creditors.*, sum(loan) as total_loan").group(:id, :creditor_id)
    end

    def create
        @debitor = Debitor.new(debitor_params)
        
        if @debitor.save
                flash[:notice] = ["Registered successfully"]

                session[:debitor_id] = @debitor.id 
            return redirect_to debitors_path
        end

        errors = @debitor.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    private 
        def debitor_params
            params.require(:debitor).permit(:first_name, :last_name, :email, :password, :reason, :description, :amount, :raised)
        end
end
