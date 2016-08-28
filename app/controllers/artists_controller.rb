class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    gon.positions = @artist.positions.map{ |p| p.name }
    @checkins_order_by_ranking = Checkin.where(artist: @artist).sort_by do |checkin|
      checkin.distance
    # @distance =
    end
  end

  def index
    @artists=Artist.all
  end
end
