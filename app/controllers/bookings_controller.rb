class BookingsController < ApplicationController
  def new
    @booking = Booking.new(booking_params)
  end

  def create
    @personalized_trainer = PersonalizedTrainer.find(params[:personalized_trainer_id])
    @booking.personalized_trainer = @personalized_trainer
    @booking.user = current_user
    @booking.fee = @personalized_trainer.rate
    @booking.goal = @personalized_trainer.category #?
    @booking.status = 'Booked'
    if @booking.save
      redirect_to personalized_trainers_path
    else
      render :show
    end
  end

  private
  
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :fee, :goal, :status)
  
  end
end
