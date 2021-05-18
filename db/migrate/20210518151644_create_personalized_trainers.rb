class CreatePersonalizedTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :personalized_trainers do |t|
      t.string :name
      t.string :category
      t.text :description
      t.string :location
      t.integer :rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
