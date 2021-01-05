class AddToCartsController < ApplicationController
	def create
		@add_to_cart = CartProduct.new(cart_id: params[:cart_id], product_id: params[:product_id], quantity: params[:quantity])
		@add_to_cart.save
	end
	def update
		@add_to_cart = CartProduct.find_by id: params[:id]
		@add_to_cart.update(quantity: params[:quantity]) 
	end
end
