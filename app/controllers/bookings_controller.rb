class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @personalized_trainer = PersonalizedTrainer.find(params[:personalized_trainer_id])
    @booking.personalized_trainer = @personalized_trainer
    @booking.user = current_user
    @booking.fee = @personalized_trainer.rate * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      flash[:alert] = "You have booked your personal trainer successfully"
      redirect_to personalized_trainers_path
    else
      render "personalized_trainers/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :goal)
  end
end
