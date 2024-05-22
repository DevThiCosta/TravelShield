class CreateDangerAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :danger_areas do |t|
      t.integer :risk
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
