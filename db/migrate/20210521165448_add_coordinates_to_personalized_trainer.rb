class AddCoordinatesToPersonalizedTrainer < ActiveRecord::Migration[6.0]
  def change
    add_column :personalized_trainers, :latitude, :float
    add_column :personalized_trainers, :longitude, :float
  end
end
