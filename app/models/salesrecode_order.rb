class SalesrecodeOrder
  include ActiveModel::Model
  attr_accessor :postcode, :city, :address, :origin_address_id, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do

    validates :user_id
    validates :token
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :origin_address_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "must be 10 to 11 digits" } 
  end

  def save
    salesrecode = Salesrecode.create(user_id: user_id, item_id: item_id) 
    Order.create(postcode: postcode, origin_address_id: origin_address_id, city: city, building: building, address:address,
      phone_number: phone_number, salesrecode_id: salesrecode.id)
  end
end
