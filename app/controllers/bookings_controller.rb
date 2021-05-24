class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @personalized_trainer = PersonalizedTrainer.find(params[:personalized_trainer_id])
    @booking.personalized_trainer = @personalized_trainer
    @booking.user = current_user
    @booking.fee = @personalized_trainer.rate * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      flash[:alert] = "You have booked your personal trainer successfully"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    set_booking
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit
    end
  end

  def edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:personalized_trainer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :goal)
  end
end
