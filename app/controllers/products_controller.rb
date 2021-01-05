class ProductsController < ApplicationController
  def index
  end
  
  def show
  	@product = Product.find_by id: params[:id]
  	@comments = @product.comments
    @rates = @product.rates
  	if @product.nil?
  		redirect_to root_url
  	end
  	if user_signed_in?
  		@cart_product = current_cart.cart_products.find_by product_id: @product.id
      @rate = @product.rates.find_by user_id: current_user.id
  	end	
  end
end
