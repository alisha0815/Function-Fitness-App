class PersonalizedTrainersController < ApplicationController

  before_action :set_personal_trainer, only: [:show, :edit, :destroy]

  def new
    @personalized_trainer = PersonalizedTrainer.new
  end

  def create
    @personalized_trainer = PersonalizedTrainer.new(personal_trainer_params)
    if @personalized_trainer.save
      redirect_to personalized_trainer_path(@personalized_trainer)
    else
      render :new
    end
  end

  private

  def set_personal_trainer
    @personalized_trainer = PersonalizedTrainers.find(params[:id])
  end

  def personal_trainer_params
    params.require(:personalized_trainer).permit(:name, :category, :description, :location, :rate)
  end
end
