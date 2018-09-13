require 'rails_helper'

RSpec.describe 'importer' do
  it 'reads the file' do
    expect(file_fixture("test.txt").read).to eq("Hello\n")
  end
end
