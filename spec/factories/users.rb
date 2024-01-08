FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email                 { Faker::Internet.email }
    password            {"a1"+Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { 'テスト' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birth_date            { Date.today }
  end
end
