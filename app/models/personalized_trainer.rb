class PersonalizedTrainer < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  # has_one :user, through: booking # one or many?

  validates :name, presence: true
  validates :category, presence: true
  # validates_length_of :description, minimum: 6
  validates :location, presence: true
  validates :rate, presence: true
end
