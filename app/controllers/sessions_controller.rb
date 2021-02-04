class SessionsController < ApplicationController
    def new; end

    def create
        user = User.find_by_name(params[:name])
        if user
            session[:current_user_id] = user.id
            flash[:success] = 'Successfully Logged In!'
            redirect_to root_path
          else
            flash.now[:alert] = 'Name not found!'
            render :new
          end
    end

    def destroy
        session.delete(:current_user_id)
        @_current_user = nil
        flash[:success] = 'Successfully Logged Out!'
        redirect_to root_url
    end
end
