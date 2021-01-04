class AddSubtotalToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :subtotal, :integer
  end
end
