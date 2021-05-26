class PersonalizedTrainer < ApplicationRecord

  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one :review, through: :booking

  validates :name, presence: true
  validates :category, presence: true
  validates_length_of :description, minimum: 6
  validates :location, presence: true
  validates :rate, presence: true

  include PgSearch::Model
  pg_search_scope :search_by,
                  against: {
                    category: 'A',
                    location: 'B',
                    name: 'C'
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
