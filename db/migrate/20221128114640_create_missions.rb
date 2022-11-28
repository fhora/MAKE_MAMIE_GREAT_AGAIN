class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :reward_cents
      t.string :location
      t.string :start_date
      t.string :end_date
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
