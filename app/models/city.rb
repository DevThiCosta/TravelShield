class City < ApplicationRecord

  has_many :danger_areas

  validates :name, presence: true
  validates :district, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :safety_tip, presence: true

  geocoded_by :full_name
  after_validation :geocode

  def full_name
    "#{name} #{state} #{country}"
  end
end
