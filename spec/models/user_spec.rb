require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  it 'has a valid factory' do
    expect(user).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'username' do
    it 'should not be blank' do
      user.username = ' '
      expect(user).to_not be_valid
    end

    it 'should not be under 6 characters' do
      user.username = 'abcd'
      expect(user).to_not be_valid
    end

    it 'should not be over 40 characters' do
      user.username = 'a' * 41
      expect(user).to_not be_valid
    end
  end

  describe 'email' do
    it 'should not have a blank value' do
      user.email = ' '
      expect(user).to_not be_valid
    end

    it 'should not be over 80 characters' do
      long_strong = 'a' * 75
      user.email = "#{long_strong}@aaaa.com"
      expect(user).to_not be_valid
    end

    it 'should be in the correct format' do
      valid_emails = %w[user@example.com john@gmail.com j.jameson@yahoo.com john+smith@co.uk.org]
      valid_emails.each do |email|
        user.email = email
        expect(user).to be_valid
      end
    end

    it 'should not accept invalid formats' do
      invalid_emails = %w[.com@com j:john@where v@yocom .@.com]
      invalid_emails.each do |email|
        user.email = email
        expect(user).to_not be_valid
      end
    end
  end

  describe 'password' do
    let(:user2) { User.new(username: 'big-dawg', email: 'big-dawg@dawghouse.com',
                           password: 'password', password_confirmation: 'password')
                }
    it 'should be present' do
      user2.password = ' '
      user2.password_confirmation = ' '
      expect(user2).to_not be_valid
    end

    it 'should not be too long' do
      user2.password = 'a' * 17
      user2.password_confirmation = 'a' * 17
      expect(user2).to_not be_valid
    end

    it 'should match password confirmation' do
      user2.password = 'password'
      user2.password_confirmation = 'different'
      expect(user2).to_not be_valid
    end
  end
end
