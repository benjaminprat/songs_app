class Api::SongsController < ApplicationController
  def index
    @songs = Song.all
    render "index.json.jb"
  end

  def create
    @song = Song.new(
      title: params[:title],
      artist: params[:artist],
      album: params[:album],
      year: params[:year],
    )
    @song.save
    render "show.json.jb"
  end

  def show
    the_id = params[:id]
    @song = Song.find_by(id: the_id)
    render "show.json.jb"
  end

  def update
    the_id = params[:id]
    @song = Song.find_by(id: the_id)
    @song.title = params[:title]
    @song.artist = params[:artist]
    @song.album = params[:album]
    @song.year = params[:year]
    @song.save
    render "show.json.jb"
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    render json: { message: "the song has been deleted" }
  end
end
