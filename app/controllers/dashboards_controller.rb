class DashboardsController < ApplicationController
  def index

    @my_bookings = current_user.bookings
    @personalized_trainers = current_user.personalized_trainers.order(params[:sort])

    @requests = @personalized_trainers
  end
end
