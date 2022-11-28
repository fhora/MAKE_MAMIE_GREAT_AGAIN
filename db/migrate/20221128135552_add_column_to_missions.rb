class AddColumnToMissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :missions, :mission_candidate, foreign_key: true
  end
end
