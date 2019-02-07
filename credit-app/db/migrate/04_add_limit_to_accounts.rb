class AddLimitToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :credit_limit, :decimal, :default => 20000
  end
end
