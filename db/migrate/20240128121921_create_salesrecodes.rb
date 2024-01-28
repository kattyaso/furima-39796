class CreateSalesrecodes < ActiveRecord::Migration[7.0]
  def change
    create_table :salesrecodes do |t|
      t.references :item, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
