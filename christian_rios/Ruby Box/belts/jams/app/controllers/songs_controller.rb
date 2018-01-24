class SongsController < ApplicationController
    before_action :require_login, only: [:index, :show]

    def index
        @user = current_user
        # @song = Song.joins("left join playlists on songs.id = playlists.song_id").group(:id).order('count(playlists.id) DESC')
        @song = Song.includes(:playlists).group(:id).order('count(playlists.id) DESC').references(:playlists)
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            flash[:notice] = ["You have added a new song to the hub!"]

            return redirect_to :back
        end

        errors = @song.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back
    end

    def show
        @song = Song.find(params[:id])
        
        @users = User.joins(:playlists).where("playlists.song_id = ?", @song).select('users.*, count(users.id) as added_count').group(:id)

    end

    private 
        def song_params
            params.require(:song).permit(:title, :artist)
        end
end