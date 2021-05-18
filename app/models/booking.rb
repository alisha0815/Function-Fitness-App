class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :personalized_trainer

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :fee, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  # validates_length_of :goal, minimum: 6
end
