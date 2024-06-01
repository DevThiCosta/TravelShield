class City < ApplicationRecord
  geocoded_by :name
  after_validation :geocode

  has_many :danger_areas

  validates :name, presence: true, uniqueness: true
  validates :district, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :safety_tip, presence: true
end
