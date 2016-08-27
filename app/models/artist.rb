class Artist < ActiveRecord::Base

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
end