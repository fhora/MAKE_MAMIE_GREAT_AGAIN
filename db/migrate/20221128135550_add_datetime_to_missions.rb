class AddDatetimeToMissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :start_date, :datetime
    add_column :missions, :end_date, :datetime
  end
end
