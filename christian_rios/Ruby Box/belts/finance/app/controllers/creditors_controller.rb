class CreditorsController < ApplicationController

    def index
        @creditor = current_user
        @debitor = Debitor.all
        @loans = Institution.joins(:debitor).where("institutions.creditor_id = ?", @creditor).select("debitors.*, sum(loan) as total_loan").group(:creditor_id, :debitor_id)
    end

    def create
        @creditor = Creditor.new(creditor_params)
        
        if @creditor.save
            flash[:notice] = ["Registered successfully"]

            session[:creditor_id] = @creditor.id 
            return redirect_to creditors_path
        end

        errors = @creditor.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end


    private

        def creditor_params
            params.require(:creditor).permit(:first_name, :last_name, :email, :password, :money)
        end
end
