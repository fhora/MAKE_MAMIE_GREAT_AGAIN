class AddSeenDateToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :seen_date, :datetime
  end
end
