class Booking < ApplicationRecord
  # enum status: [:pending, :accepted, :declined, :completed]
  STATUS = %w(pending accept decline complete)

  belongs_to :user
  belongs_to :personalized_trainer
  has_many :review

  validates :status, inclusion: { in: STATUS }
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  # validates_length_of :goal, minimum: 6

  after_create :set_fee 



  def booked_date_range
    { from: :start_date, to: :end_date }
  end

  private
  def set_fee
    update(fee: personalized_trainer.rate * (end_date - start_date).to_i)
  end
  
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def client
    user
  end

end
