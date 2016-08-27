class Checkin < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist

  def create
    #TODO: ajaxで飛んできたパラメーターをクリエイト
  end
end