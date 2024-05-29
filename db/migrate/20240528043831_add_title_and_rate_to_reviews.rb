class AddTitleAndRateToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :rate, :integer
  end
end
