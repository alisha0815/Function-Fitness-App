class AddEducationToPersonalizedTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :personalized_trainers, :education, :string
  end
end
