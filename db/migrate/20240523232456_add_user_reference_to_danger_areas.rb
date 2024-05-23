class AddUserReferenceToDangerAreas < ActiveRecord::Migration[7.1]
  def change
    add_reference :danger_areas, :user, foreign_key: true
  end
end
