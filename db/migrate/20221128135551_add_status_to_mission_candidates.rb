class AddStatusToMissionCandidates < ActiveRecord::Migration[7.0]
  def change
    change_column :mission_candidates, :status, :string, default: "waiting"
  end
end
