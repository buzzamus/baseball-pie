require 'rails_helper'
require 'csv'

RSpec.describe 'import' do
  describe 'file parser' do
    let(:raw_text) { file_fixture('test.txt').read }
    let(:date) { raw_text[1..8] }
    it 'should read the file' do
      expect(raw_text[1..8]).to eq('20160403')
    end

    it 'should parse the correct year' do
      expect(date[0..3]).to eq('2016')
    end
    it 'should create the correct month name' do
      month_names = %w[January February March April
                       May June July 'August
                       September October November December]
      adjusted_month = month_names[(date[(4..5)].to_i - 1)]
      expect(adjusted_month).to eq('April')
    end
  end

  describe 'home run calculator' do
    # test file of 'tmp/homers.txt' contains all home run totals for each team from 2016 season retrosheet
    # there are 30 lines (each representing each team's total home run total)
    # The total of 5610 has been fact checked to verify that is the correct number of homeruns in MLB for 2016
    # This number was then checked against the numbers returned within live run of upload for 2016 retrosheet
    let(:file_path) { "tmp/homers.txt"}
    team_counter = 0
    hr_num = 0
    let!(:csv) do
      CSV.foreach(file_path) do |line|
        team_counter += 1
        hr_num += line[0].to_i
      end
    end
    it 'should return same number of teams in league and same number of total homeruns for year' do
      expect(team_counter).to eq(30)
      expect(hr_num).to eq(5610)
    end
  end
end
