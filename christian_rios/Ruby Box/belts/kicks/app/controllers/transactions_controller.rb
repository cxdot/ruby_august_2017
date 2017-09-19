class TransactionsController < ApplicationController
    before_action :require_login, only: [:index, :show]
    ENV['TZ'] = "America/Chicago"
    def create
        user = current_user
        seller = User.find(params[:user_id])
        amount = params[:amount]
        shoe_name = params[:shoe_name]
        seller_name = "#{seller.first_name} #{seller.last_name}"
        @transaction = Transaction.new(:user_id => seller.id, :kickz_id => user.id, :buyer => "#{user.first_name} #{user.last_name}", :purchased => Time.now, :seller => seller_name, :amount => amount, :product => shoe_name)
        if @transaction.save
            shoe = Kickz.find(params[:id])
            shoe.update(user_id: user.id, sold: "true")
        end
        return redirect_to :back
    end
end
