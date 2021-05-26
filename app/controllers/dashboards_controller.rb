class DashboardsController < ApplicationController
  def index

    # 3. My bookings with Trainers
    @my_bookings = current_user.bookings
    # @my_bookings = Booking.where(user: current_user)
    # raise

    # 2. My Team
    @personalized_trainers = current_user.personalized_trainers.order(params[:sort])

    # 1. incoming pending requests
    @requests = @personalized_trainers
  end
end
