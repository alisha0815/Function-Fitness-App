class PersonalizedTrainersController < ApplicationController
  before_action :set_personalized_trainer, only: [:show, :edit, :destroy, :update]
  

  def index
    @personalized_trainers = PersonalizedTrainer.all
  end
  
  def show
<<<<<<< HEAD
    set_personalized_trainer
=======
>>>>>>> 157b58e4ba1b2531743035f53e2d225063f259c6
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

  def edit 
<<<<<<< HEAD
    set_personalized_trainer
  end 

  def update 
    set_personalized_trainer
    if @personalized_trainer.update(personalized_trainer_params)
      redirect_to @personalized_trainer
    else
      render :edit
    end
  end
  
=======
  end

  def update 
    if @personalized_trainer.update(personalized_trainer_params)
      redirect_to personalized_trainers_path(@personalized_trainer)
    else
      render :edit 
    end
  end

  def destroy
    @personalized_trainer.destroy
    redirect_to personalized_trainers_path
  end
>>>>>>> 157b58e4ba1b2531743035f53e2d225063f259c6

  private

  def set_personalized_trainer
    @personalized_trainer = PersonalizedTrainer.find(params[:id])
  end

  def personalized_trainer_params
    params.require(:personalized_trainer).permit(:name, :category, :description, :location, :rate, :photo, :user_id)
  end
end
