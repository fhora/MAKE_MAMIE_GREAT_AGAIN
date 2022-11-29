class AddStatusToMission < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :status, :boolean, default: false
  end
end
