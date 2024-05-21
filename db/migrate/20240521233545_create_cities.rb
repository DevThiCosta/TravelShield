class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :district
      t.string :country
      t.string :state
      t.string :safety_tip

      t.timestamps
    end
  end
end
