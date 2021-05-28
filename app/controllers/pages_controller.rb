class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  	@personalized_trainers = PersonalizedTrainer.all
  end

  def profile_page
    @current_user = current_user
  end
end
