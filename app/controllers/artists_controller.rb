class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    artist_positions = Position.find_by(artist_id: "#{@artist.id}")
    gon.place = artist_positions.name
    @checkins_order_by_ranking = Checkin.where(artist: @artist).sort_by do |checkin|
      checkin.distance
    end
  end

  def index
    @artists=Artist.all
  end
end
