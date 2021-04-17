class Post < ApplicationRecord
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes 
    has_one :shop_detail
    has_many :comments, dependent: :destroy
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

    # バリデーション
    # 電話番号（ハイフンありなし10桁・11桁）
    VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
    
    # 郵便番号（ハイフンあり3桁・5桁・7桁）
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/
    validates :title,           presence: true, length: { maximum: 30 }
    validates :postalcode,      presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :prefecturecode,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 47}
    validates :address1,        presence: true, length: { maximum: 20 }
    validates :address2,        presence: true, length: { maximum: 20 }
    validates :phonenumber,     presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
    


  # 画像用
    mount_uploader :image, ImageUploader
end
