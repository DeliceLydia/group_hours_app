require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create(name: 'josiane')
  end

  it 'should not validate if name provided is short' do
    group = Group.new(name: 'ma')
    expect(group).to_not be_valid
  end

  it 'should not validate if name provided exist' do
    Group.create(name: 'ruby')
    group = Group.new(name: 'ruby')
    expect(group).to_not be_valid
  end

  it 'should not validate if not provided a name' do
    group = Group.new(name: nil)
    expect(group).to_not be_valid
  end

  it 'should not be valid if not provided a user_id' do
    group = Group.new(name: 'ruby', user_id: nil)
    expect(group).to_not be_valid
  end

  it 'should be valid if provided a name' do
    group = Group.new(name: 'ruby', user_id: @user.id)
    expect(group).to be_valid
  end
end
