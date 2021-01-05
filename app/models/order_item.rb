class OrderItem < ApplicationRecord
	belongs_to :order 
	belongs_to :product
	def unit_price
		product.price
	end
	def total
		unit_price * quantity
	end
end
