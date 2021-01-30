class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy 
    has_one :shop_detail
end
