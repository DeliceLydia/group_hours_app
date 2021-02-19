require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should not be valid without all attributes' do
      user = User.new(name: nil, avatar: nil)
      expect(user).to_not be_valid
    end

    it 'should be valid if provided all attributes' do
      user = User.new(name: 'josiane')
      expect(user).to be_valid
    end

    it 'should not be valid if provided existed name' do
      User.create(name: 'josiane')
      user2 = User.new(name: 'josiane')
      expect(user2).to_not be_valid
    end

    it 'should not be valid if length name is not 3 caracters minimum' do
      user = User.new(name: 'jo')
      expect(user).to_not be_valid
    end
  end
end
