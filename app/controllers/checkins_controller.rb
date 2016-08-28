class CheckinsController < ApplicationController
  def create
    checkin = Checkin.create(checkin_parameters)
    checkin.user = current_user
    checkin.save

    redirect_to Artist.find(params[:artist_id])
  end

  private

  def checkin_parameters
    params.permit(:artist_id, :distance, :latitude, :longitude)
  end
end