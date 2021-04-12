class Post < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes 
    has_one :shop_detail
    has_many :comments, dependent: :destroy
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

    # バリデーション
    validates :title,   presence: true, length: { maximum: 30 } 
    validates :content, presence: true, length: { maximum: 500 }
    VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
    validates :phonenumber, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
    
  # 画像用
    mount_uploader :image, ImageUploader
end
