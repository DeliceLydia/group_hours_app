require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GroupingsHelper. For example:
#
# describe GroupingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GroupingsHelper, type: :helper do
  describe 'total hours' do
    before(:example) do
      user = User.create(name: 'lydia')
      5.times do |i|
        Grouping.create(name: "hours_grouping#{i}", hours: i, author_id: user.id)
      end
      @groupings = Grouping.all
    end
    it 'gives sum of all hours' do
      expect(total_hours(@groupings)).to eq 10
    end
  end
end
