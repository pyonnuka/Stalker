class HomeController < ApplicationController
  def index
    redirect_to action: :login unless current_user
  end

  def login
    redirect_to action: :index if current_user
  end

  def welcome
    
  end
end