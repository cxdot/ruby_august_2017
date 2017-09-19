class UsersController < ApplicationController
    before_action :require_login, only: [:index, :show]

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = ["Registered successfully"]

            session[:user_id] = @user.id
            return redirect_to songs_path
        end

        errors = @user.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end
    
    def show
        @user = User.find(params[:id])
        @songs = Song.joins(:playlists).where("playlists.user_id = ?", @user).select('songs.*, count(songs.id) as added_count').group(:id)

    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
