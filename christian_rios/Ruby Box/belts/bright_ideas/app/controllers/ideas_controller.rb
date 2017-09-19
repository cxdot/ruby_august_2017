class IdeasController < ApplicationController
    before_action :auth, only: [:destroy]

    before_action :require_login, only: [:index, :show, :destroy]

    def index
        @user = current_user
        @ideas = Idea.joins('LEFT OUTER JOIN likes ON likes.idea_id = ideas.id').select('ideas.*, count(likes.id) as like_count').group(:id).order("like_count DESC")

    end

    def create
        @idea = Idea.new(idea_params)
        if @idea.save
            flash[:notice] = ["You have posted a new idea!!"]

            return redirect_to :back
        end

        errors = @idea.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    def show
        @idea = Idea.find(params[:id])
        @liked = @idea.liked_by
    end 

    def destroy
        @idea = Idea.find(params[:id])
        @idea.delete

        redirect_to :back
    end
        
    private 
        def idea_params
            params.require(:idea).permit(:content).merge(user: current_user)
        end

        def auth
            idea = Idea.find(params[:id])

            return redirect_to ideas_path unless current_user == idea.user
        end
end
