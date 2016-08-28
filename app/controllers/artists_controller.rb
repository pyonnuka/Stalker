class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    gon.position = @artist.positions.where.not(name: nil).map{ |p| p.name }
    @checkins_order_by_ranking = Checkin.where(artist: @artist).sort_by do |checkin|
      checkin.distance
    end
  end

  def index
    @artists=Artist.all
  end
end
