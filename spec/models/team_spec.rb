require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:sheet_key) }
    it { should validate_length_of(:sheet_key).is_equal_to(3) }
    it { should validate_uniqueness_of(:sheet_key).case_insensitive }
    it { should validate_presence_of(:league) }
    it { should validate_length_of(:league).is_equal_to(2) }
    it { should validate_length_of(:city).is_at_least(4) }
    it { should validate_length_of(:city).is_at_most(50) }
    it { should validate_length_of(:park).is_at_least(4) }
    it { should validate_length_of(:park).is_at_most(50) }
  end

  describe 'team city' do
    let(:team2) { Team.new(sheet_key: "MIA", league: "NL") }

    it 'should accept a blank value' do
      expect(team2).to be_valid
    end
  end

  describe 'team ballpark' do
    let(:team3) { Team.new(sheet_key: "NYA", league: "AL", city: "New York") }
    it 'should accept a blank value' do
      expect(team3).to be_valid
    end
  end
end
