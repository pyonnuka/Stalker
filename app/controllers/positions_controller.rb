class PositionsController < WebsocketRails::BaseController
  def change
    message = message()
    broadcast_message :show_message, message
  end
end