class PersonalizedTrainersController < ApplicationController
  before_action :set_personalized_trainer, only: [:show, :edit, :destroy]

  def index
    @personalized_trainers = PersonalizedTrainer.all
  end

  def show
    @personalized_trainer = PersonalizedTrainer.find(params[:id])
  end

  def new
    @personalized_trainer = PersonalizedTrainer.new
  end

  def create
    @personalized_trainer = PersonalizedTrainer.new(personalized_trainer_params)
    if @personalized_trainer.save
      redirect_to personalized_trainer_path(@personalized_trainer)
    else
      render :new
    end
  end

  private

  def set_personalized_trainer
    @personalized_trainer = PersonalizedTrainer.find(params[:id])
  end

  def personalized_trainer_params
    params.require(:personalized_trainer).permit(:name, :category, :description, :location, :rate)
  end
end
