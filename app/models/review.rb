class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # レビューのコメントは2００字
  validates :content, presence: true, length: { maximum: 200 }
  validates :star,    presence: true

  def reviewed_by?(user)
    reviews.where(user_id: user.id).exists?
  end
end
