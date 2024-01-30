class SalesrecodeOrder
  include ActiveModel::Model
  attr_accessor :postcode, :city, :address, :origin_address_id, :building, :phone_number, :item, :price, :user_id
  with_options presence: true do
    validates :price, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999,
      message: 'Half-width number and must be in the range of 300 to 9,999,999'}
    validates :user_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :origin_address_id, numericality: {other_than: 0, message: "can't be blank"}
  end
  def save
    salesrecode = Salesrecode.create(price: price, user_id: user_id)
    Order.create(postcode: postcode, origin_address_id: origin_address_id, city: city, building: building,
     phone_number: phone_number, item_id: item_id, user_id: user.id)
  end
end