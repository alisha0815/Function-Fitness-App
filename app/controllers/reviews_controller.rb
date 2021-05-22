class ReviewsController < ApplicationController
    # As soon as the session(booking) is over the user will be asked to leave a review on his bookings dashboard.
  require 'date'

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to dashboard_path(@booking_id)
    else
      render 'dashboard'
    end
  end
    
  private
    
    def review_params
      params.require(:review).permit(:content)
    end
end
