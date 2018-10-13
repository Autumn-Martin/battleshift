class AddActivationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation, :integer
  end
end
