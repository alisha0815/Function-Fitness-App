class Review < ApplicationRecord
  belongs_to :booking
  # does it belong to user / personalized_trainer ?
  validates :comment, presence: true
  # validates_length_of :comment, minimum: 6
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
