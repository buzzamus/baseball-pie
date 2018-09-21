require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryBot.create(:game) }
  it 'has a valid factory' do
    expect(game).to be_valid
  end
  describe 'validations' do
    it { should validate_presence_of(:home_team) }
    it { should validate_length_of(:home_team).is_equal_to(3) }
    it { should validate_presence_of(:away_team) }
    it { should validate_length_of(:away_team).is_equal_to(3) }
    it { should validate_presence_of(:game_year) }
    it { should validate_length_of(:game_year).is_equal_to(4) }
    it { should validate_presence_of(:park) }
    it { should validate_presence_of(:month) }
  end
end
