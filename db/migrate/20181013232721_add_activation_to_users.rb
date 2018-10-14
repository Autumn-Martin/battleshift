class AddActivationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :activation, :integer, default: 0
  end
end
