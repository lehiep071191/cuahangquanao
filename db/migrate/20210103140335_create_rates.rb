class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :rate
      t.integer :user_id, foreign_key: true
      t.integer :product_id, foreign_key: true

      t.timestamps
    end
  end
end
