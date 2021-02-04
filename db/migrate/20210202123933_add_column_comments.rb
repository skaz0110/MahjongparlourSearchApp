class AddColumnComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :image, :string
    add_column :comments, :title, :string
  end
end
