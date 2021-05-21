class DashboardsController < ApplicationController
  def index
    @personalized_trainers = current_user.personalized_trainers
    @personalized_trainers = PersonalizedTrainer.order(params[:sort])
  end
end
