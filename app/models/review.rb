class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # レビューのコメントは５字〜１００字
  #
  validates :content, presence: true, length: { maximum: 100 }
  validates :star,    presence: true

  def reviewed_by?(user)
    reviews.where(user_id: user.id).exists?
  end

end
