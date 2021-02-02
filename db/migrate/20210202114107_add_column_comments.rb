class AddColumnComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :star, :float
  end
end
