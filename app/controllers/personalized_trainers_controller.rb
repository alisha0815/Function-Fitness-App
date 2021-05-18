class PersonalizedTrainersController < ApplicationController

	def index
		@trainers = Trainer.all
	end
end
