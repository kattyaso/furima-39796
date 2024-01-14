class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item                 ,null:false
      t.text       :description          ,null:false
      t.integer    :category_id          ,null:false
      t.integer    :sales_status_id      ,null:false
      t.integer    :fee_status_id        ,null:false
      t.integer    :origin_address_id    ,null:false
      t.integer    :schedule_delivery_id ,null:false
      t.integer    :price                ,null:false
      t.references :user                 ,null:false , foreign_key:true
      t.timestamps
    end
  end
end