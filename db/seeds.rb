# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pm = "#{Rails.root}/db/seeds_images/1_main.jpg"
p1 = "#{Rails.root}/db/seeds_images/1_1.jpg"
p2 = "#{Rails.root}/db/seeds_images/1_2.jpg"
p3 = "#{Rails.root}/db/seeds_images/1_3.jpg"

desc_short = '南森町のちょっと不思議な日替りマスターバー「週間マガリ」にて英会話BAR「英語勉強虫」をオープンします。

参加対象は、英語に興味のある方。毎回、外国人の先生を招いて、英語でのコミュニケーションを楽しみます。
基本の営業スタイルはバーですので、日本語NGなどの制限は設けません。
好きなタイミングでふらっと訪れて、1杯だけ飲んで帰れるような自由な空間です）。'

desc_long = '英語のレベル別に楽しみ方を分類してみました。

Beginner(初心者):
簡単な自己紹介を考えてきて下さい。ここはお酒OKのバーですから、きっと他所よりも気楽に話せると思います。まだ会話はちょっと、、という方でもリスニングだけのつもりで是非気楽にお越し下さい。

Intermediate(中級者):
海外のバーやパブで盛り上がるのはどんな話題なんでしょう？格好良いお酒の頼み方とは？普通の英会話スクールとはちょっと違った質問をしてみませんか。海外旅行や留学の面白い体験談があれば是非シェアして下さい。

Expert(上級者):
日本人の英語学習メソッドについて一家言のある方、是非、ご披露下さい。聞き流すだけじゃ、やっぱり駄目でしょ？等々。先生との会話は楽しんで頂けるかと思いますが、他の方もある程度ついて来られるようなご配慮をお願いします。

ご質問等あれば、お気軽にお問い合わせ下さい。

■料金
　参加費: 1000円（1ドリンク+おつまみ付）
　アルコール 500円より
　ソフトドリンク 400円
　※当店はCash on delivery（注文時精算）制です。

■開催場所
「週間マガリ」【隠れ家ゆえ、道順を事前に確認の上、おいでください。】
住所：大阪府大阪市天神橋 1 丁目 11-13 2F
MAP：http://goo.gl/maps/Yh28A
最寄り駅は
★JR 東西線「大阪天満宮駅」
★地下鉄谷町線・堺筋線「南森町駅」
※大阪梅田からひと駅圏内、どちらも駅から徒歩 5 分
道のりは両駅共に駅を出て、天神橋商店街(エイブル・mini mini がある方)を突き進むとアーケードが途切れます。さらに進むと、左手に「ふくろうのみせ」があるその向かいの建物2Fです。'

user = User.create(email: "yousei.itou@gmail.com",name: "Yosei",password: "secret123")

Event.create(title:'第5回英語勉強虫',opendate:'2015-02-03',opendate_memo:'19:00~23:00 (LO 22:30)',
  address_title: '週間マガリ', fee_memo: '1ドリンク+おつまみ',
  postal:'',address:'大阪府大阪市天神橋 1 丁目 11-13 2F',address_embed:'http://goo.gl/maps/Yh28A',
  fee:1000,limit:0,desc_short:desc_short,
  picture_main: File.read(pm),
  picture_1: File.read(p1), picture_2: File.read(p2), picture_3: File.read(p3),
  desc_long:desc_long,url:'http://www.englishworm.com',visible:true,user:user)

Event.create(title:'第6回英語勉強虫',opendate: Date.today ,opendate_memo:'19:00~23:00 (LO 22:30)',
  address_title: '週間マガリ', fee_memo: '1ドリンク+おつまみ',
  postal:'',address:'大阪府大阪市天神橋 1 丁目 11-13 2F',address_embed:'http://goo.gl/maps/Yh28A',
  fee:1000,limit:0,desc_short:desc_short,
  picture_main: File.read(pm),
  picture_1: File.read(p1), picture_2: File.read(p2), picture_3: File.read(p3),
  desc_long:desc_long,url:'http://www.englishworm.com',visible:true,user:user)

Event.create(title:'第7回英語勉強虫',opendate: (Date.today + 1),opendate_memo:'19:00~23:00 (LO 22:30)',
  address_title: '週間マガリ', fee_memo: '1ドリンク+おつまみ',
  postal:'',address:'大阪府大阪市天神橋 1 丁目 11-13 2F',address_embed:'http://goo.gl/maps/Yh28A',
  fee:1000,limit:0,desc_short:desc_short,
  picture_main: File.read(pm),
  picture_1: File.read(p1), picture_2: File.read(p2), picture_3: File.read(p3),
  desc_long:desc_long,url:'http://www.englishworm.com',visible:true,user:user)

if Rails.env.development?
  u1 = User.create(email: "user1@test.com",name: "太郎1",password: "secret123")
  u2 = User.create(email: "user2@test.com",name: "次郎2",password: "secret123")

  d1 = Date.today + 1.days

  Event.create(title: 'test',opendate:d1.to_s,
    address_title: 'test', picture_main: File.read(pm),
    desc_short:'',desc_long:'',user:user)
end
