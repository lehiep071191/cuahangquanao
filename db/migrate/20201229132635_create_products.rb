class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :author
      t.text :des
      t.decimal :price

      t.timestamps
    end
  end
end
