# Post.create!(:title => '綾瀬雀荘', :image => '画像', :content => '足立区綾瀬の雀荘です！')
# Post.create!(:title => '川崎雀荘', :image => '画像', :content => '神奈川県川崎市の雀荘です！')
# p "テストデータ作成成功です"

User.destroy_all
Comment.destroy_all

user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")
#user4 = User.create!(email: "test@example.com", password: "password")

Comment.create!(content: "沖縄そば", user_id: user2.id)
Comment.create!(content: "海ぶどう", user_id: user1.id)
Comment.create!(content: "ゴーヤチャンプル", user_id: user3.id)
Comment.create!(content: "サータアンダギー", user_id: user3.id)
Comment.create!(content: "タコライス", user_id: user1.id)

puts "初期データの投入に成功しました！"