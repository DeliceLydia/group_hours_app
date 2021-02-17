class GroupsController < ApplicationController
  before_action :logged_in

  def index
    @groups = Group.index_group(params[:page])
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.user_id = current_user.id
    if group.save
      flash[:success] = 'Group added successfully!'
      redirect_to groups_path
    else
      flash[:danger] = group.errors.full_messages
      redirect_back(fallback_location: new_group_path)
    end
  end

  def show
    @group = Group.show_group(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
