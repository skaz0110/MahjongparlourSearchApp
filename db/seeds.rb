# 削除
# User.destroy_all
# User.last.destroy
# Review.destroy_all
# Post.destroy_all
# ShopDetail.destroy_all
# Like.destroy_all

# post1 = Post.create!(user_id: 1, title: 'ジャン綾瀬', postalcode: '111-0000', prefecturecode: 13, address1: '港区',
#                      address2: '６丁目', address3: 'ミナトクビル101号', phonenumber: '080-1222-3456', access: '徒歩１分', openinghours: '２４時間営業', regularholiday: '水曜', gamefree: '１ゲーム３００円', gameset: '１２００円', image: '画像', content: 'ようこそ！')
# post2 = Post.create!(user_id: 1, title: 'ホワイト', postalcode: '412-0032', prefecturecode: 7, address1: '松山市',
#                      address2: '7-1', address3: '', phonenumber: '090-1233-7899', access: '駅から５分', openinghours: '８時〜２６時', regularholiday: '年中無休', gamefree: '１ゲーム３００円', gameset: '７００円', image: '画像', content: '元気に営業してます！')
# post3 = Post.create!(user_id: 1, title: 'ブル', postalcode: '765-0056', prefecturecode: 5, address1: '福岡市',
#                      address2: '8-1-3', address3: '福岡タワー801号', phonenumber: '050-1242-8798', access: '〇〇駅から徒歩１０分', openinghours: '９時〜２７時', regularholiday: '月曜', gamefree: '１ゲーム３００円', gameset: '８００円', image: '画像', content: 'どうぞ！')
# post4 = Post.create!(user_id: 1, title: 'JAST', postalcode: '789-3456', prefecturecode: 9, address1: '梅田',
#                      address2: '3丁目6-21', address3: '梅田ハイツ１階', phonenumber: '070-1433-1234', access: '車で移動', openinghours: '２４時間営業', regularholiday: '祝日', gamefree: '１ゲーム３００円', gameset: '１０００円', image: '画像', content: '初心者歓迎！！')

# user1 = User.create!(email: 'satou@example.com', password: 'password')
# user2 = User.create!(email: 'suzuki@example.com', password: 'password')
# user3 = User.create!(email: 'tanaka@example.com', password: 'password')
# user4 = User.create!(email: 'test@example.com', password: 'password')

# Review.create!(content: '沖縄そば', user_id: user2.id)
# Review.create!(content: '海ぶどう', user_id: user1.id)
# Review.create!(content: 'ゴーヤチャンプル', user_id: user3.id)
# Review.create!(content: 'サータアンダギー', user_id: user3.id)
# Review.create!(content: 'タコライス', user_id: user1.id)

# ShopDetail.create!(address: '東京都葛飾区', phonenumber: '080', access: '足立駅から北に２分', openinghours: 'オープン〜ラスト',
#                    regularholiday: '水曜日', gamefree: '３００円', gameset: '４００円', post_id: post1.id)
# ShopDetail.create!(address: '松山市', phonenumber: '080', access: '松山駅から北に２分', openinghours: 'オープン〜ラスト', regularholiday: '木曜',
#                    gamefree: '４００円', gameset: '５００円', post_id: post4.id)
# ShopDetail.create!(address: '渋谷区', phonenumber: '090', access: '渋谷駅から北に２分', openinghours: 'オープン〜ラスト', regularholiday: '土曜',
#                    gamefree: '５００円', gameset: '３００円', post_id: post3.id)
# ShopDetail.create!(address: '川崎市', phonenumber: '0120', access: '川崎駅から北に２分', openinghours: 'オープン〜ラスト', regularholiday: '日曜',
#                    gamefree: '６００円', gameset: '２００円', post_id: post2.id)

# ShopDetail.create!(address: '東京都葛飾区', phonenumber: '080', access: '足立駅から北に２分', openinghours: 'オープン〜ラスト',
#                    regularholiday: '水曜日', gamefree: '３００円', gameset: '４００円')
# ShopDetail.create!(address: '松山市', phonenumber: '080', access: '松山駅から北に２分', openinghours: 'オープン〜ラスト', regularholiday: '木曜',
#                    gamefree: '４００円', gameset: '５００円')
# ShopDetail.create!(address: '渋谷区', phonenumber: '090', access: '渋谷駅から北に２分', openinghours: 'オープン〜ラスト', regularholiday: '土曜',
#                    gamefree: '５００円', gameset: '３００円')
# ShopDetail.create!(address: '川崎市', phonenumber: '0120', access: '川崎駅から北に２分', openinghours: 'オープン〜ラスト', regularholiday: '日曜',
#                    gamefree: '６００円', gameset: '２００円')

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
5.times do
  Like.create!(user_id:1,post_id:54)
  Like.create!(user_id:1,post_id:53)
end
puts '初期データの投入に成功しました！'
