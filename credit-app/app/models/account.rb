require 'pry'
class Account < ApplicationRecord
  belongs_to :user
  has_many :activities
  validates_presence_of :name, :user_id,:balance


  private
  def amount_valid?(amount)
    if amount <= 0
      puts 'Transaction failed! Amount must be greater than 0.00'
      return false
    end
    return true
  end
end
