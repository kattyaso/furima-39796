class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id,numericality:{other_than: 1 , message: "can't be blank"}

  belongs_to :sales_status
  validates :sales_status_id,numericality:{other_than: 1 , message: "can't be blank"}

  belongs_to :fee_status
  validates :fee_status_id,numericality:{other_than: 1 , message: "can't be blank"}

  belongs_to :origin_address
  validates :origin_address_id,numericality:{other_than: 1 , message: "can't be blank"}

  belongs_to :schedule_delivery
  validates :schedule_delivery_id,numericality:{other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :item, presence: true
  validates :description, presence: true
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999,
    message: 'Half-width number and must be in the range of 300 to 9,999,999'
  }
end
