class CreateShopDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_details do |t|
      t.string :address
      t.integer :phonenumber
      t.string :access
      t.string :openinghours 
      t.string :regularholiday
      t.string :gamefree
      t.string :gameset 
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
