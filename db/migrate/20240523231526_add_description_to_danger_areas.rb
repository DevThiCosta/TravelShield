class AddDescriptionToDangerAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :danger_areas, :description, :string
  end
end
