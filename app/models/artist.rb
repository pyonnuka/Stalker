class Artist < ActiveRecord::Base
  has_many :positions
  has_many :checkins

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |artist|
      artist.name = name
      artist.image_url = image_url
    end
  end

  def now_position
    positions.order(:in_there_at).each.with_index(1) do |position, i|
      return positions[i - 1] if position.in_there_at > DateTime.now
    end

    positions.last
  end
end
