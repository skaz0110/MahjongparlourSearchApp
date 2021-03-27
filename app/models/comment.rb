class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #バリデーション
  validates :content, presence: true, length: { in: 1..100 }
end
