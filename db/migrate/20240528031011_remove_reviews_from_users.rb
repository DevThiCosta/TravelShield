class RemoveReviewsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :reviews, :string
  end
end
