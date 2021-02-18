class GroupingsController < ApplicationController
  before_action :logged_in

  def index
    @groupings = Grouping.grouping_index(params[:page], current_user).grouped
  end

  def external_index
    @groupings = Grouping.external(params[:page], current_user)
    render 'index'
  end

  def new
    @grouping = Grouping.new
  end

  def create
    grouping = Grouping.new(grouping_params)
    grouping.author_id = current_user.id
    if grouping.save
      group_id = params[:grouping][:group_id]
      GroupHour.create(group_id: group_id, grouping_id: grouping.id) if group_id
      flash[:success] = 'Grouped hours added'
      redirect_to groupings_path
    else
      flash[:danger] = grouping.errors.full_messages
      redirect_back(fallback_location: new_grouping_path)
    end
  end

  private

  def grouping_params
    params.require(:grouping).permit(:name, :hours)
  end
end
