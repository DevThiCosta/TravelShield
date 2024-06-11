class City < ApplicationRecord
  has_many :danger_areas
  has_many :reviews

  validates :name, presence: true
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

  geocoded_by :full_name
  after_validation :geocode

  def full_name
    "#{name} #{state} #{country}"
  end
end
