class MeetupsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

    def create
        @group = Group.find(params[:id])

        Meetup.create(user: current_user, group: @group)

        return redirect_to :back
    end

    def destroy
        @group = Group.find(params[:id])

        Meetup.find_by(group: @group, user: current_user).delete

        return redirect_to :back
    end
end
