class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :update, :show, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    #code
  end

  def update
    # @song.title = song_params[:title]
    # @song.released = song_params[:released]
    # @song.release_year = song_params[:release_year]
    # @song.artist_name = song_params[:artist_name]
    # @song.genre = song_params[:genre]
    @song.update(song_params)
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def show
    #code
  end

  def destroy
    #code
    @song.destroy
    redirect_to songs_path
  end

  def find_song
    @song = Song.find_by(id: params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
