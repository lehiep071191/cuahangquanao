class Admin::ProductsController < Admin::ApplicationController
	before_action :set_product, only: [:edit,:update,:destroy] 
	def index
		@products = Product.all
	end
	def new
		@product = Product.new
	end
	def create
		@product = Product.new product_params
		if @product.save!
			respond_to do |format|
				format.html{redirect_to admin_products_path}
				format.js
			end
		else

		end	
	end
	def edit
		
	end
	def update
		@product.update(product_params)
		respond_to do |format|
			format.html{redirect_to admin_products_path}
			format.js
		end	

	end
	def destroy
		
	end
	private
	def set_product
		@product = Product.find_by id: params[:id]
		if @product.nil?
			redirect_to admin_products_path, noitice: "not found"
		end	
	end
	def product_params
		params.require(:product).permit(:name, :author, :des, :price,:url_image, category_ids: [])
	end
end	