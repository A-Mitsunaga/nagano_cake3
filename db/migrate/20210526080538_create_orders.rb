class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.timestamps
    end
  add_foreign_key :orders, :items
  end
end
