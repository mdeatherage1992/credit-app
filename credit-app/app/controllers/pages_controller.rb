class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

  def secret
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

  def index
    if current_user
    @user = current_user
    @account = Account.find_by(user_id: @user.id)
    @deposit = Activity.new
    @withdraw = Activity.new
    if @account
    @rate = (@account.balance * 0.35).to_d
    @daily = (@rate / 365).round(3)
    @compounder = @daily / 12
  if @account.activities
    @activities = Account.find(@account.id).activities.order('created_at DESC')
    @last = @account.created_at
    @time = Time.now
    @monthly = time_in_completed_months(@last,@time)
    @hourly = time_in_completed_hours(@last,@time)
  end
end
    if @deposit.save || @withdraw.save
    redirect_to "index", :flash => "Successful Activity"
      end
    end

  end


0.35 / 365 * 30

end
