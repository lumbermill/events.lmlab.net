# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(email: "user1@test.com",name: "太郎",password: "secret123")
u2 = User.create(email: "user2@test.com",name: "次郎",password: "secret123")

pm = "#{Rails.root}/db/seeds_images/1_main.jpg"
p1 = "#{Rails.root}/db/seeds_images/1_1.jpg"
p2 = "#{Rails.root}/db/seeds_images/1_2.jpg"
p3 = "#{Rails.root}/db/seeds_images/1_3.jpg"

d = Date.today

Event.create(title:'第5回英語勉強虫',opendate:d.to_s,opendate_memo:'19:00~23:00',
  postal:'',address:'',address_embed:'',fee:1000,limit:0,desc_short:'',
  picture_main: File.read(pm),
  picture_1: File.read(p1), picture_2: File.read(p2), picture_3: File.read(p3),
  desc_long:'',url:'http://www.englishworm.com',visible:true,user:u1)

Event.create(title:'Ruby on rails徹底入門',opendate:(d+1.days).to_s,opendate_memo:'19:00~23:00',
  postal:'',address:'',address_embed:'',fee:1000,limit:0,desc_short:'',
  picture_main: File.read(p2),
  picture_1: File.read(p3), picture_2: File.read(pm), picture_3: File.read(p1),
  desc_long:'',url:'http://www.lmlab.net',visible:true,user:u2)
