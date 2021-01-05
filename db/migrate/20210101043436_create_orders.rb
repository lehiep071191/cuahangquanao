class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :username
      t.string :address
      t.string :user_id, foreign_key: true
      t.string :phone
      t.string :status

      t.timestamps
    end
  end
end
