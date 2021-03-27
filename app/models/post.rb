class Post < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes 
    has_one :shop_detail
    has_many :comments, dependent: :destroy

    # バリデーション
    validates :title,   presence: true, length: { in: 1..50 }
    validates :content, presence: true, length: { in: 20..500 }
    validates :address, presence: true, length: { in: 5..200 }
    
  # 画像用
    mount_uploader :image, ImageUploader
end
