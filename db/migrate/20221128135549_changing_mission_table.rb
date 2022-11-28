class ChangingMissionTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :missions, :start_date, :datetime
    remove_column :missions, :end_date, :datetime
  end

  def add
    add_column :missions, :start_date, :datetime
    add_column :missions, :end_date, :datetime
  end
end
