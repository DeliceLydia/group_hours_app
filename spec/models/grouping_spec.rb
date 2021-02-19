require 'rails_helper'

RSpec.describe Grouping, type: :model do
  before(:example) do
    @user = User.create(name: 'josiane')
    @hours = 10
  end

  it 'should not validate if name provided is short' do
    grouping = Grouping.new(name: 'ma', hours: 10)
    expect(grouping).to_not be_valid
  end

  it 'should not validate if name provided exist' do
    Grouping.create(name: 'math', hours: 10)
    grouping = Grouping.new(name: 'math', hours: 10)
    expect(grouping).to_not be_valid
  end

  it 'should not validate if hours provided is not a number' do
    grouping = Grouping.new(name: 'math', hours: 'ten')
    expect(grouping).to_not be_valid
  end

  it 'should not validate if not provided a name' do
    grouping = Grouping.new(name: nil, hours: 10)
    expect(grouping).to_not be_valid
  end

  it 'should not validate if hours are not provided ' do
    grouping = Grouping.new(name: 'math', hours: nil)
    expect(grouping).to_not be_valid
  end

  it 'should not be valid if author is not provided ' do
    grouping = Grouping.new(name: 'math', hours: 10, author_id: nil)
    expect(grouping).to_not be_valid
  end

  it 'should be valid if all attributes are provided ' do
    grouping = Grouping.new(name: 'math', hours: 10, author_id: @user.id)
    expect(grouping).to be_valid
  end
end
