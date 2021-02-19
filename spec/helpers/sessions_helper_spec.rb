require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe 'current user' do
    before(:example) do
      @user = User.create(name: 'lydia')
    end

    it 'return current user' do
      log_in(@user)
      expect(current_user).to eq @user
    end

    it 'should return nil value if user did not login' do
      expect(current_user).to be nil
    end

    it 'returns true if user logged in' do
      log_in(@user)
      expect(logged_in?).to be true
    end

    it 'returns false if user not logged in' do
      expect(logged_in?).to be false
    end
  end
end
