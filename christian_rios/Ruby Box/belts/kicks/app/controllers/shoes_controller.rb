class ShoesController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy, :show]

    def index
        @user = current_user
        @kickz = Kickz.all
    end

    def create
        @kickz = Kickz.new(shoe_params)
        if @kickz.save
            flash[:notice] = ["You have posted a new pair of shoes for sale."]

            return redirect_to shoes_path
        end

        errors = @kickz.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    def destroy
        @shoe = Kickz.find(params[:id])
        @shoe.delete

        redirect_to :back
    end
        

    private

        def shoe_params
            params.require(:shoe).permit(:name, :amount, :user_id)
        end
end
