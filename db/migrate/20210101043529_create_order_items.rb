class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :product_id, foreign_key: true
      t.integer :order_id, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
