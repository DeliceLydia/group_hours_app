class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = 'Signed Up successful, login to continue!'
            log_in @user
            redirect_to login_path
        else
            flash[:danger] = @user.errors.full_messages
            redirect_back(fallback_location: signup_path)
        end
    end

    def show
        @user = current_user
        return if logged_in?
        flash[:danger] = ['Access not allowed. Please login as this user first']
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :avatar)
    end
end
