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
            log_in @user
            flash[:success] = 'Signed Up successful, login to continue!'
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = current_user
        return if logged_in?
        flash[:danger] = ['Access not allowed. Please login as this user first']
        redirect_to root_url
    end

    private

    def user_params
        params.require(:user).permit(:name, :avatar)
    end
end
