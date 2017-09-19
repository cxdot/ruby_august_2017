class LikesController < ApplicationController
    before_action :require_login
    
    def create
        idea = Idea.find(params[:like_id])

        Like.create(idea: idea, user: current_user)

        return redirect_to :back
    end
end
