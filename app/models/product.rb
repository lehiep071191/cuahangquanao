class Product < ApplicationRecord
	has_many :product_categories
	has_many :categories, through: :product_categories
	has_many :cart_products, dependent: :destroy
	has_many :carts, through: :cart_products
	has_many :order_items
	has_many :comments
	has_many :rates
	before_save :set_avarage

	def avarage
		tb = rates.collect{|rate| rate.valid? ? rate.rate.to_i : 0 }.sum.to_f
		if rates.length > 0
			tb/rates.length
		end	
	end	
	private
	def set_avarage
		self[:_avarage] = avarage
	end	
end

