class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    gon.position = @artist.positions.where.not(name: nil).map{ |p| p.name }
  end

  def index
    @artists=Artist.all
  end
end
