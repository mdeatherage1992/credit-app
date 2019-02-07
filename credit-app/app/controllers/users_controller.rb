class UsersController < ApplicationController

  def buy_index
  end

  def index

  end

  def new

  end

  def create
end

  def destroy
  end

  def edit
  end

  def show

  end


  private

  def user_params
    params.require(:user).permit()
    end


  end
