class Post < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes 
    has_one :shop_detail
    has_many :comments, dependent: :destroy

    # 画像用
    mount_uploader :image, ImageUploader
end
