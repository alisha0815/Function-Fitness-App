class DashboardsController < ApplicationController
  def index
    @personalized_trainers = current_user.personalized_trainers
  end
end
