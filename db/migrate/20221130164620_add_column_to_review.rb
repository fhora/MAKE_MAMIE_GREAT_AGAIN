class AddColumnToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :reviewer_id, :integer
  end
end
