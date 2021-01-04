class PagesController < ApplicationController
  def index
  	@products = Product.all.limit(8).order(created_at: :desc)
  	@cart_product = CartProduct.new
  end
end
