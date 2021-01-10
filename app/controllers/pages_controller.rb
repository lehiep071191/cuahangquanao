class PagesController < ApplicationController
  def index
  	@products = Product.all.limit(8).order(created_at: :desc)
  	@cart_product = CartProduct.new
  	@best_sales = Product.limit(4).best_saler

  end
end
