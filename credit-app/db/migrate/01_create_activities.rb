class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.decimal :deposit
      t.decimal :withdraw
      t.decimal :close
      t.timestamps
    end
    add_reference :activities, :account, foreign_key: true
    add_reference :activities, :user, foreign_key: true
  end
end
