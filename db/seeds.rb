# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a1 = Artist.create(id:'2', name:'はるちゃん2')
a2 = Artist.create(id:'3', name:'はるちゃん3')
a3 = Artist.create(id:'4', name:'はるちゃん')

a1.positions << Position.create(name: "渋谷", event_title: "ライブ", event_url: "http://twitter.com", in_there_at: "2016-8-28")
a2.positions << Position.create(name: "埼玉スーパーアリーナ", event_title: "ライブ", event_url: "http://event.com", in_there_at: "2016-8-30")
a3.positions << Position.create(name: "東京ドーム", event_title: "ライブ", event_url: "http://twitter.com", in_there_at: "2016-8-31")

u1 = User.create(provider: "twitter", uid: "1468911907", nickname: "ぬっかー", image_url: nil, created_at: nil, updated_at: nil)
u2 = User.create(provider: "twitter", uid: "1468911908", nickname: "ぬっかー2", image_url: nil, created_at: nil, updated_at: nil)
u3 = User.create(provider: "twitter", uid: "1468911909", nickname: "ぬっかー3", image_url: nil, created_at: nil, updated_at: nil)
u1.checkins << Checkin.create(artist_id: 2, latitude: 35.6813, longitude: 139.7662, distance: '321')
u2.checkins << Checkin.create(artist_id: 2, latitude: 35.6813, longitude: 139.7662, distance: '28')
u3.checkins << Checkin.create(artist_id: 2, latitude: 35.6813, longitude: 139.7662, distance: '602')
