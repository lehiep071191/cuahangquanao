class RatesController < ApplicationController
	def create
		@product = Product.find_by id: params[:product_id]
		@rate = Rate.new(user_id: params[:user_id], product_id: params[:product_id], rate: params[:rate])
		if @rate.save
			render json: {
				data_rate: ((@product.rates.collect {|rate| rate.valid? ? rate.rate : 0}.sum.to_f)/@product.rates.length)
			}
		end
	end

	def update
		@product = Product.find_by id: params[:product_id]
		@rate = Rate.find_by(id: params[:id])
		if @rate.update!(rate: params[:rate])
			render json: {
				data_rate: ((@product.rates.collect {|rate| rate.valid? ? rate.rate : 0}.sum.to_f)/@product.rates.length)
			}
		end
	end
	private
	def rate_params
		params.require(:rate).permit(:user_id, :product_id, :rate)
	end
end
