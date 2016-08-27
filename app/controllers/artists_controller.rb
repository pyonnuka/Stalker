class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @checkins_order_by_ranking = Checkin.where(artist: @artist).sort_by do |checkin|
      checkin.distance
    end
  end
end
