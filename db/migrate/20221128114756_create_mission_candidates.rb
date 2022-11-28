class CreateMissionCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :mission_candidates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mission, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
