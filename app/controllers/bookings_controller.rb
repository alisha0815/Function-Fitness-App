class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def create
    @booking = Booking.new(booking_params)
    @personalized_trainer = PersonalizedTrainer.find(params[:personalized_trainer_id])
    @booking.personalized_trainer = @personalized_trainer
    @booking.user = current_user
    @booking.fee = @personalized_trainer.rate * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      flash[:notice] = "Booked successfully"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking.user = current_user
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path(current_user)
      flash[:notice] = 'Booking updated!'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :goal)
  end
end
