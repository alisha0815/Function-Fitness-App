class PersonalizedTrainersController < ApplicationController
    # This show methods redirects to the show view page and displays one personal trainer based on hes id
    def show 
      @personalized_trainer = PersonalizedTrainer.find(params[:id])
    end


    private 



end
