class AddNameAndAddressAndReviewsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :reviews, :string
  end
end
