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
end
