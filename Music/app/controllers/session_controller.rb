class SessionController < ApplicationController


  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:message] = "Invalid email/password combination"
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end
end
