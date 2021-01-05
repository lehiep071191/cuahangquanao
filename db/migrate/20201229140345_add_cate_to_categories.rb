class AddCateToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :cate, :string
  end
end
