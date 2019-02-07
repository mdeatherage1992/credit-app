class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  def deposit
    deposit_key = params[:activity][:deposit].to_i
    @user = current_user
    @account = @user.account
    @deposit = @account.activities.new(user_id: @user.id,withdraw:nil,close:nil)
    @deposit[:deposit] = deposit_key
    @deposit.save
    balance = @account.balance.to_i
    @account.balance = balance - deposit_key
    @account.save
    @user.save
  end

  def withdraw
    withdraw_key = params[:activity][:withdraw].to_i
    @user = current_user
    @account = @user.account
    @limit = @account.credit_limit
    if @account.balance.to_i + withdraw_key.to_i < @limit
    @withdraw = @account.activities.new(user_id: @user.id,deposit:nil,close:nil)
    @withdraw[:withdraw] = withdraw_key
    @withdraw.save
    balance = @account.balance.to_i
    @account.balance = balance + withdraw_key
    @account.save
    @user.save
    end
  end

  def create
    @user = current_user
    @account = @user.account
    if params[:activity][:withdraw]
      self.withdraw
      flash.now[:withdraw] = "Withdrawn"
      redirect_to root_path
  else if params[:activity][:deposit]
      self.deposit
      flash.now[:deposit] = "Deposit"
      redirect_to root_path
  else
    flash.now[:danger] = "Wrong Input"
    redirect_to root_path
      end
    end
  end

private

def activities_params
params.require(:activity).permit(:deposit,:withdraw,:close)
end



end
