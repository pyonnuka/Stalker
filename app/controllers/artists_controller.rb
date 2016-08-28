class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    artist_positions = Position.find_by(artist_id: "#{@artist.id}")
    gon.position = @artist.positions.where.not(name: nil).map{ |p| p.name }
  end

  def index
    @artists=Artist.all
  end
end
