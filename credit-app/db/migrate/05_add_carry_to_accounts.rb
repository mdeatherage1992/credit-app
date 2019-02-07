class AddCarryToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :carry, :decimal, :default => 0
  end
end
