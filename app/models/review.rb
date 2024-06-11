class Review < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :title, :comment, :rate, :city_id, presence: true
  validates :rate, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
end
