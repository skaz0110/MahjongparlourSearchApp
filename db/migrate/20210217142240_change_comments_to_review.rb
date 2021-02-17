class ChangeCommentsToReview < ActiveRecord::Migration[6.1]
  def change
    rename_table :comments, :reviews
  end
end
