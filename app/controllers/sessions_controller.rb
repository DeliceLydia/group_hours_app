class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      log_in user
      flash[:success] = 'Successfully Logged In!'
      redirect_to user
    else
      flash.now[:alert] = 'Name not found!'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'Successfully Logged Out!'
    redirect_to root_url
  end
end
