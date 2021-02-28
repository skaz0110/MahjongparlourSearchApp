class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews,  dependent: :destroy
  has_many :likes
  has_many :comments, dependent: :destroy
  
  ##  画像用
  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ##  いいねが存在しているかをチェック
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

  # ゲストログイン用のアカウントを生成する sessions_controllerで呼び出し
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "ゲスト雀士"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end