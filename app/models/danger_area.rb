class DangerArea < ApplicationRecord
  belongs_to :city

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :risk, presence: true, inclusion: { in: 1..5 }
  validates :latitude, presence: true
  validates :longitude, presence: true

end
