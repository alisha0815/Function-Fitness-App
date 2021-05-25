class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]

  def create
    @booking = Booking.new(booking_params)
    @personalized_trainer = PersonalizedTrainer.find(params[:personalized_trainer_id])
    @booking.personalized_trainer = @personalized_trainer
    @booking.user = current_user
    @booking.fee = @personalized_trainer.rate * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      flash[:notice] = "You have booked your personal trainer successfully"
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  def update
    @booking.user = current_user
    set_booking
    if @booking.update(booking_params)
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'Booking updated!'
    else
      render :edit
    end
  end

  def edit
    @booking.user = current_user
  end

  private

  def set_booking
    #@booking.user = current_user
    @booking = Booking.find(params[:personalized_trainer_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :goal)
  end
end
