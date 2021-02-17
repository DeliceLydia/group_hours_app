require 'coveralls'
Coveralls.wear!
require 'rails_helper'

RSpec.describe GroupHour, type: :model do
  before(:example) do
    @user = User.create(name: 'josiane')
    @group = Group.create(name: 'ruby', user_id: @user.id)
    @grouping = Grouping.create(name: 'math', hours: 50, author_id: @user.id)
  end

  it 'does not validate if group not exist' do
    group_hour = GroupHour.new(group_id: 100, grouping_id: @grouping.id)
    expect(group_hour).to_not be_valid
  end

  it 'does not validate if grouping not exist' do
    group_hour = GroupHour.new(group_id: @group.id, grouping_id: 100)
    expect(group_hour).to_not be_valid
  end

  it 'does not validate if grouping and group does not exist' do
    group_hour = GroupHour.new(group_id: 100, grouping_id: 100)
    expect(group_hour).to_not be_valid
  end

  it 'does be valid if all info exist' do
    group_hour = GroupHour.new(group_id: @group.id, grouping_id: @grouping.id)
    expect(group_hour).to be_valid
  end
end
