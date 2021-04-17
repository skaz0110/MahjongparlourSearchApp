class Contact < ApplicationRecord
  
  # バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name,    presence: true, length: { maximum: 20 }
  validates :email,   presence: true, length: { maximum: 255 } , format: { with: VALID_EMAIL_REGEX }
  validates :content, presence: true, length: { maximum: 500 }
end
