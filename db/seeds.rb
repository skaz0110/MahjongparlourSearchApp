# 削除
# User.destroy_all
# User.last.destroy
# Comment.destroy_all
# Post.destroy_all
# ShopDetail.destroy_all
# Like.destroy_all

#  post1=Post.create!(:title => 'ジャン綾瀬', :image => '画像', :content => '足立区綾瀬の雀荘です！')
#  post2=Post.create!(:title => '川崎一番', :image => '画像', :content => '神奈川県川崎市の雀荘です！')
#  post3=Post.create!(:title => '渋谷ワールド', :image => '画像', :content => '渋谷区の雀荘です！')
#  post4=Post.create!(:title => '雀荘マツヤマ', :image => '画像', :content => '松山市のの雀荘です！')

# user1 = User.create!(email: "satou@example.com", password: "password")
# user2 = User.create!(email: "suzuki@example.com", password: "password")
# user3 = User.create!(email: "tanaka@example.com", password: "password")
# user4 = User.create!(email: "test@example.com", password: "password")

# Comment.create!(content: "沖縄そば", user_id: user2.id)
# Comment.create!(content: "海ぶどう", user_id: user1.id)
# Comment.create!(content: "ゴーヤチャンプル", user_id: user3.id)
# Comment.create!(content: "サータアンダギー", user_id: user3.id)
# Comment.create!(content: "タコライス", user_id: user1.id)

# ShopDetail.create!(address: "東京都葛飾区",phonenumber: "080",access: "足立駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "水曜日",gamefree: "３００円",gameset: "４００円", post_id: post1.id)
# ShopDetail.create!(address: "松山市",phonenumber: "080",access: "松山駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "木曜",gamefree: "４００円",gameset: "５００円", post_id: post4.id)
# ShopDetail.create!(address: "渋谷区",phonenumber: "090",access: "渋谷駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "土曜",gamefree: "５００円",gameset: "３００円", post_id: post3.id)
# ShopDetail.create!(address: "川崎市",phonenumber: "0120",access: "川崎駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "日曜",gamefree: "６００円",gameset: "２００円", post_id: post2.id)

# ShopDetail.create!(address: "東京都葛飾区",phonenumber: "080",access: "足立駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "水曜日",gamefree: "３００円",gameset: "４００円")
# ShopDetail.create!(address: "松山市",phonenumber: "080",access: "松山駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "木曜",gamefree: "４００円",gameset: "５００円")
# ShopDetail.create!(address: "渋谷区",phonenumber: "090",access: "渋谷駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "土曜",gamefree: "５００円",gameset: "３００円")
# ShopDetail.create!(address: "川崎市",phonenumber: "0120",access: "川崎駅から北に２分",openinghours: "オープン〜ラスト",regularholiday: "日曜",gamefree: "６００円",gameset: "２００円")

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts "初期データの投入に成功しました！"