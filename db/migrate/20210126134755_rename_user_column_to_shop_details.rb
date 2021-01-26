class RenameUserColumnToShopDetails < ActiveRecord::Migration[6.1]
  def change

    remove_reference :shop_details, :user, index: true
    add_reference :shop_details, :post, index: true
  end
end
