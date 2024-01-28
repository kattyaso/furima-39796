class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :postcode, null: false
      t.integer :origin_address_id, null:false
      t.string :city, null: false
      t.string :address, null: false
      t.string :bulding
      t.string :phone_number, null: false
      t.references :salesrecode, null: false, foreign_key:true
      t.timestamps
    end
  end
end
