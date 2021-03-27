class Contact < ApplicationRecord
  
  # バリデーション
  validates :name,    presence: true, length: { in: 1..20 }
  validates :email,   presence: true
  validates :content, presence: true, length: { in: 5..200 }
end
