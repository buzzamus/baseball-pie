FactoryBot.define do
  sequence :email do |i|
    "foo#{i}@bar.com"
  end
  factory :user do
    username 'hight!de_47'
    email { generate(:email) }
    password 'password'
    password_confirmation 'password'
    timestamps 'MyString'
  end
end
