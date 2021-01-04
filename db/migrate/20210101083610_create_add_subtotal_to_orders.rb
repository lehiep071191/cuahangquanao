class CreateAddSubtotalToOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :add_subtotal_to_orders do |t|
      t.decimal :subtotal

      t.timestamps
    end
  end
end
