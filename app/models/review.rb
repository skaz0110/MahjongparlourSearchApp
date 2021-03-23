class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def reviewed_by?(user)
    reviews.where(user_id: user.id).exists?
  end



  #validates :content, presence: true
  validates :star, presence: true
end
