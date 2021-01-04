class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_products, dependent: :destroy
	has_many :products, through: :cart_products
	before_save :set_subtotal
	def subtotal
		cart_products.collect {|cart_product| cart_product.valid? ? cart_product.unit_price * cart_product.quantity : 0}.sum
	end
	private
	def set_subtotal
		self[:subtotal] = subtotal
	end
end
