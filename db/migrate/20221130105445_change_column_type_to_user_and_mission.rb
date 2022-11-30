class ChangeColumnTypeToUserAndMission < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :description, :text
    change_column :missions, :description, :text
  end
end
