class GroupsController < ApplicationController
    before_action :logged_in

    def index
        @groups = Group.includes(:user).paginate(page: params[:page], per_page: 3).order(:name).with_attached_icon
    end

end
