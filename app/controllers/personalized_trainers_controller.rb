class PersonalizedTrainersController < ApplicationController

	def index
		@personalized_trainers = PersonalizedTrainer.all
	end
end
