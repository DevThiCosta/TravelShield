class AddCityReferenceToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :city, null: false, foreign_key: true
  end
end
