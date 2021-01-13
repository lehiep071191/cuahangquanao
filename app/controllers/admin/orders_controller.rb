class Admin::OrdersController < Admin::ApplicationController
	before_action :set_order, only: [:show, :update]
	def index
		if params['status'].present?
			@orders = Order.send(params['status'])
		else	
			@orders = Order.all
		end	
	end
	def show
		
	end
	def update
		ids =  params[:id].split(",").map {|id| id.to_i}
		Order.update(ids, ids.map{|id| {status: params[:status].to_i}})
		render json: {
			data_update_order: Order.find_by(id: ids.first).status
		}
		byebug
		if params[:status] == "1"
			ids.each do |id|
				@order = Order.find_by id: id
				OrderMailer.destroy_order(@order).deliver_now
			end	
		end
	end	
	private	
	def set_order
		@order = Order.find_by id: params[:id]
	end
end
