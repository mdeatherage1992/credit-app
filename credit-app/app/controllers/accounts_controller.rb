class AccountsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = current_user
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    @account.save
    @user.account_id = @account.id
    @user.save
    redirect_to user_accounts_path(@user)
  end

  def index
    @user = current_user
    @account = @user.account
  end

  def new
    @user = current_user
    @account = Account.new
  end


  def time_in_completed_months (bm, m)
    a = m.month - bm.month
    a = a - 1 if (
         bm.day >  m.day
    )
    a
end

def time_in_completed_hours (bh, h)
  a = h.hour - bh.hour
  a = a - 1 if (
       bh.min >  h.min
  )
  a
end

def self.add_accrual
  @accounts = Account.all
  @accounts.each do |t|
  @rate = (t.balance * 0.35).to_d
  @daily =  (@rate / 365).round(3)
  t.carry += @daily
  t.save
  end
end




def self.add_juice
  @accounts = Account.all
  @accounts.each do |t|
    t.balance += t.carry
    t.save
  end
end



  private
  def account_params
    params.require(:account).permit(:name, :balance, :user_id)
  end

  def amount
    param = params.permit(:amount)
    param[:amount].to_f
  end
end
