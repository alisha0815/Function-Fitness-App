class PersonalizedTrainersController < ApplicationController
  before_action :set_personalized_trainer, only: [:show, :edit, :destroy, :update]

  def index
    if params[:query].present?
      @personalized_trainers = PersonalizedTrainer.search_by(params[:query])
    elsif params[:category]
      @personalized_trainers = PersonalizedTrainer.where(category: params[:category])
    else
      @personalized_trainers = PersonalizedTrainer.all
    end

    @markers = @personalized_trainers.geocoded.map do |personalized_trainer|
      {
        lat: personalized_trainer.latitude,
        lng: personalized_trainer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { personalized_trainer: personalized_trainer })
      }
    end
  end

  def show
    @booking = Booking.new
    @bookings = @personalized_trainer.bookings
  end

  def new
    @personalized_trainer = PersonalizedTrainer.new
  end

  def create
    @personalized_trainer = PersonalizedTrainer.new(personalized_trainer_params)
    @personalized_trainer.user = current_user
    if @personalized_trainer.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    set_personalized_trainer
    if @personalized_trainer.update(personalized_trainer_params)
      redirect_to @personalized_trainer
    else
      render :edit
    end
  end

  private

  def set_personalized_trainer
    @personalized_trainer = PersonalizedTrainer.find(params[:id])
  end

  def personalized_trainer_params
    params.require(:personalized_trainer).permit(:name, :category, :description, :location, :rate, :photo, :user_id)
  end
end
