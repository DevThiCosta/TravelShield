class AddCityReferenceToDangerAreas < ActiveRecord::Migration[7.1]
  def change
    add_reference :danger_areas, :city, foreign_key: true
  end
end
