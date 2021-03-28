class Post < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes 
    has_one :shop_detail
    has_many :comments, dependent: :destroy

    # バリデーション
    validates :title,   presence: true, length: { maximum: 30 } 
    validates :content, presence: true, length: { maximum: 500 }
    validates :address, presence: true, length: { maximum: 100 }
    
  # 画像用
    mount_uploader :image, ImageUploader
end
