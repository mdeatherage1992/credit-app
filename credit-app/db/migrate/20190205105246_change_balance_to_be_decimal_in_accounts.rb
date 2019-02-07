class ChangeBalanceToBeDecimalInAccounts < ActiveRecord::Migration[5.2]
  def change
     change_column :accounts, :balance, :decimal
  end
end
