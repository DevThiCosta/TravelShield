class CreateSavedCitiesUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :saved_cities_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :city
    end

    add_index :saved_cities_users, [:user_id, :city_id], unique: true
  end
end
