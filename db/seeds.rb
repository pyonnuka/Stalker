# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Artist.create(id:'2', name:'はるちゃん2')
Artist.create(id:'3', name:'はるちゃん3')
Artist.create(id:'4', name:'はるちゃん')

Artist.find(2).positions << Position.create(name: "渋谷WWW", event_title: "ライブ", event_url: "http://twitter.com", in_there_at: "2016-8-28")
