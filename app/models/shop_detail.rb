class ShopDetail < ApplicationRecord
    belongs_to :post , optional: true
end
