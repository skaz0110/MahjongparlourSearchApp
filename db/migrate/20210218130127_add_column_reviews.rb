class AddColumnReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :post, foreign_key: true
  end
end
