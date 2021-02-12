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
        session.delete[:current_user_id]
        @_current_user = nil
        flash[:success] = 'Successfully Logged Out!'
        redirect_to login_path
    end
end