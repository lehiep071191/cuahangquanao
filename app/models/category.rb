class Category < ApplicationRecord
	has_many :product_categories
	has_many :products, through: :product_categories
	validates :cate, uniqueness: true, presence: true 
	# def cate
	# 	self.cate = cate.capitalize
	# end
	private	
	def set_cate
		self[:cate] = cate
	end	
end
