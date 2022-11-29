class RemoveMissionCandidateIdToMission < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :missions, :mission_candidates
  end
end
