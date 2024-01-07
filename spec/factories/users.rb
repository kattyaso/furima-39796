FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email                 { 'test@example' }
    password              { '000000a' }
    password_confirmation { password }
    last_name             { 'テスト' }
    first_name            { 'テスト' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birth_date            { Date.today }
  end
end
