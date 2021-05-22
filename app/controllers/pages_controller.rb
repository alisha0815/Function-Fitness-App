class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  	@personalized_trainers = PersonalizedTrainer.all
  end
end
