class PlaylistsController < ApplicationController

    def create
        song = Song.find(params[:song_id])

        playlist = Playlist.create(user: current_user, song: song)
        # limit to 1 add
        # playlist = Playlist.create(user: current_user, song: song) unless song.added_by.include? current_user

        unless playlist
            flash[:errors] = ["You have already added this song."]
        else
            flash[:notice] = ["You have added \"#{song.artist} - #{song.title}\" to your playlist."]
        end 

        return redirect_to :back
    end

end