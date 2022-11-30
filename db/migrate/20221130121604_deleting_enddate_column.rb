class DeletingEnddateColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :missions, :end_date
  end
end
