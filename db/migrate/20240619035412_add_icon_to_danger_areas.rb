class AddIconToDangerAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :danger_areas, :icon, :string
  end
end
