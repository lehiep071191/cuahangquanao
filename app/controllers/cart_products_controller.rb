class CartProductsController < ApplicationController
	def create
		@cart = current_cart
		@cart_product = CartProduct.new(cart_product_params)
		@cart_product.save
	end
	def update
		set_cart_product
		if @cart_product.update!(quantity: params[:quantity].to_i)
			render json: {
				data_cart_product: @cart_product 
			}
		end	
	end
	def destroy
		set_cart_product
		@cart_product.destroy
		respond_to do |format|
			format.html{ redirect_to request.referrer }
			format.js
		end	
	end
	private
	def set_cart_product
		@cart_product = CartProduct.find_by id: params[:id]
	end
	def cart_product_params
		params.require(:cart_product).permit(:cart_id, :product_id, :quantity)
	end
end
