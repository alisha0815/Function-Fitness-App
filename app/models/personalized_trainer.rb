class PersonalizedTrainer < ApplicationRecord
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings
  # has_one :user, through: booking # one or many?

  validates :name, presence: true
  validates :category, presence: true
  # validates_length_of :description, minimum: 6
  validates :location, presence: true
  validates :rate, presence: true

  def owner
    user
  end

end
