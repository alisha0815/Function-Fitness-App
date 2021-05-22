class DashboardsController < ApplicationController
  def index
    @personalized_trainers = current_user.personalized_trainers.order(params[:sort])
    @bookings = Booking.all
    # @bookings = current_user.bookings
  end
end
