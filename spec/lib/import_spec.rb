require 'rails_helper'

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
      month_names = ['January', 'February', 'March', 'April',
                     'May', 'June', 'July', 'August',
                     'September', 'October', 'November', 'December']
      adjusted_month = month_names[(date[(4..5)].to_i - 1)]
      expect(adjusted_month).to eq('April')
    end
  end
end
