class AddColumnToPost < ActiveRecord::Migration[6.1]
  def change
    
    # 削除
    remove_column :posts, :address, :string
    remove_column :posts, :phonenumber, :integer
    
    # 追加
    add_column :posts, :phonenumber, :string
    add_column :posts, :prefecturecode, :integer
    add_column :posts, :postalcode, :string
    add_column :posts, :address1, :string
    add_column :posts, :address2, :string
    add_column :posts, :address3, :string

  end
end
