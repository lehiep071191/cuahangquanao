class Admin::CategoriesController < Admin::ApplicationController
	def new
		@category = Category.new
	end
	def create
		@category = Category.new category_params
		if @category.save!
			respond_to do |format|
				format.html{redirect_to products_path}
				format.js
			end	
		end	
	end
	private
	def category_params
		params.require(:category).permit(:cate)
	end
end	