class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        flash[:success] = 'Sign Up successful, please login to continue!'
        redirect_to @user
    end

    def show
      @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :avatar)
    end
end
