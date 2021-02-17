class Post < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes 
    has_one :shop_detail
    mount_uploader :image, ImageUploader
end
