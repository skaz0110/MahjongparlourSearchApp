class AddColumnPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :address, :string
    add_column :posts, :phonenumber, :integer
    add_column :posts, :access, :string
    add_column :posts, :openinghours, :string
    add_column :posts, :regularholiday, :string
    add_column :posts, :gamefree, :string
    add_column :posts, :gameset, :string
  end
end
