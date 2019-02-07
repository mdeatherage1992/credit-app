class Activity < ApplicationRecord
attr_accessor :deposit
attr_accessor :withdraw
attr_accessor :close
belongs_to :account
belongs_to :user



end
