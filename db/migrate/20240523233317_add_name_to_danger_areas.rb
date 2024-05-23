class AddNameToDangerAreas < ActiveRecord::Migration[7.1]
  def change
    add_column :danger_areas, :name, :string
  end
end
