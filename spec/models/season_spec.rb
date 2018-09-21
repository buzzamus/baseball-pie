require 'rails_helper'

RSpec.describe Season, type: :model do
  let(:season) { FactoryBot.create(:season) }

  it 'has a valid factory' do
    expect(season).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:year) }
  end

  describe 'year' do
    it 'should not be blank' do
      season.year = ' '
      expect(season).to_not be_valid
    end

    it 'should not have a length less than 4' do
      season.year = '111'
      expect(season).to_not be_valid
    end

    it 'should not have a length longer than 4' do
      season.year = '12345'
      expect(season).to_not be_valid
    end

    it 'should have a length of exactly 4' do
      season.year = '1111'
      expect(season).to be_valid
    end
  end
end
