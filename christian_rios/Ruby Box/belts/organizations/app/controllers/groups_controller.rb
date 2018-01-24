class GroupsController < ApplicationController
  before_action :require_login, only: [:create, :index, :show, :destroy]

    def create
        @group = Group.new(org_params)
        if @group.save
            flash[:notice] = ["You have posted a new group!!"]

            return redirect_to :back
        end

        errors = @group.errors.full_messages

        flash[:errors] = errors
        redirect_to :back
    end

    def index
        @user = current_user
        @group = Group.all
    end

    def show
        @group = Group.find(params[:id])
        @user = User.joins(:groups).where("user_id = ?", 2)
        p @user
    end

    def destroy
        @group = Group.find(params[:id])
        @group.delete

        return redirect_to :back
    end

    private
        def org_params
            params.require(:org).permit(:name, :description).merge(user: current_user)
        end
end
