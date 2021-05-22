class ReviewsController < ApplicationController
    # As soon as the session(booking) is over the user will be asked to leave a review on his bookings dashboard.
    require 'date'
   
    def new 
      @review = Review.new
    end

    def create 
      @review = Review.new(params[:review])
      @review.save
    end
    
end
