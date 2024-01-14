FactoryBot.define do
  factory :item do
    item                  { Faker::Commerce.product_name }
    description           { Faker::Lorem.sentence }
    category_id           { rand(2..11) }
    sales_status_id       { rand(2..7) }
    fee_status_id         { rand(2..3) }
    origin_address_id     { rand(2..48) }
    schedule_delivery_id  { rand(2..4) }
    price                 { rand(300..9999999) }
    association :user
    after(:build) do |item|
      item.image.attach(io:File.open('public/images/test_image.png'), filename:'test_image.png')
    end
  end
end