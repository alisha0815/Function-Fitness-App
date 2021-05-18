class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :location, :string
    add_column :users, :weight, :integer
    add_column :users, :mobile_num, :string
  end
end
