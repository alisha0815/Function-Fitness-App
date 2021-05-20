class PersonalizedTrainersController < ApplicationController
  before_action :set_personalized_trainer, only: [:show, :edit, :destroy, :update]
  

  def index
    @personalized_trainers = PersonalizedTrainer.all
  end
  # is empty because of before action
  def show
    
  end

  def new
    @personalized_trainer = PersonalizedTrainer.new
  end

  def create
    @personalized_trainer = PersonalizedTrainer.new(personalized_trainer_params)
    @personalized_trainer.user_id = current_user.id
    if @personalized_trainer.save
      redirect_to personalized_trainers_path
    else
      render :new
    end
  end
  # is empty because of before action
  def edit 
    
  end
  # before action is beiing called on that method as well
  def update 
    if @personalized_trainer.update(personalized_trainer_params)
      redirect_to personalized_trainers_path
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
