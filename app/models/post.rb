class Post < ApplicationRecord
    has_one :shop_detail, dependent: :destroy

end
