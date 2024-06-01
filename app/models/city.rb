class City < ApplicationRecord
  geocoded_by :name
  after_validation :geocode
  has_many :danger_areas

  validates :name, presence: true, uniqueness: true
  validates :district, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :safety_tip, presence: true
  include PgSearch::Model

  pg_search_scope :search_any_location,
    against: [ :name, :district, :state, :country ],
    associated_against: {
      danger_areas: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
