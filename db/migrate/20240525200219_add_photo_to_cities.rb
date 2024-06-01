class AddPhotoToCities < ActiveRecord::Migration[7.1]
  def change
    add_column :cities, :photo, :string
  end
end
