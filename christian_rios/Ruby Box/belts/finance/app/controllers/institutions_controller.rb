class InstitutionsController < ApplicationController

    def create
        debitor = Debitor.find(params[:id])
        creditor = current_user

        @institution = Institution.new(loan:params[:loan_amount].to_i, creditor: creditor, debitor: debitor)
         if @institution.save
                debitor.update(raised: debitor.raised + params[:loan_amount].to_i)
                creditor.update(money: creditor.money - params[:loan_amount].to_i)
                flash[:notice] = ["You have loaned #{params[:loan_amount]} dollars to #{debitor.first_name} #{debitor.last_name}!"]
         end
        return redirect_to :back
    end

end
