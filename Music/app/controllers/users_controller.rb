class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Invalid email or password"
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    if current_user.nil?
      redirect_to new_session_url
      return
    end
    @user = current_user
    render :show
  end

end
