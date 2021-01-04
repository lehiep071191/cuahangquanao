class AddUrlImageToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :url_image, :string
  end
end
