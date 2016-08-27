class HomeController < ApplicationController
  def index
    redirect_to :login unless current_user
  end

  def login
    redirect_to :index if current_user
  end
end