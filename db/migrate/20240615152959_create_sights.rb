class CreateSights < ActiveRecord::Migration[7.1]
  def change
    table_exists = table_exists?(:sights)
    unless table_exists
      create_table :sights do |t|
      t.string :name
      t.string :address
      t.decimal :price
      t.float :rate
      t.string :photo
      t.text :description

      t.timestamps
      end
    end
  end
end
