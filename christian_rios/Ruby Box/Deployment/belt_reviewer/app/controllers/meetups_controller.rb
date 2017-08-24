class MeetupsController < ApplicationController
    before_action :require_login
    
    def create
        @event = Event.find(params[:id])

        Meetup.create(user: current_user, event: @event)

        return redirect_to :back
    end

    def destroy
        @event = Event.find(params[:id])

        Meetup.find_by(event: @event, user: current_user).delete

        return redirect_to :back
    end
    
end
