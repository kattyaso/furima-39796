FactoryBot.define do
  factory :salesrecode_order do
      user_id               {1}
      item_id               {1}
      postcode              { "123-4567" }
      origin_address_id     { rand(2..48) }
      city                  { Faker::Address.city }
      address               { Faker::Address.street_address }
      building              { Faker::Address.secondary_address }
      phone_number          { Faker::Number.leading_zero_number(digits: 10) }

    end
end