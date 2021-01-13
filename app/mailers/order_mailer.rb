class OrderMailer < ApplicationMailer
	def order order
		@order = order
		@url  = "http://localhost:3000/orders/#{@order.id}"
		mail to: @order.user.email, subject: "confirm"
	end
	def destroy_order order
		@order = order
		@url  = "http://localhost:3000/orders/#{@order.id}"
		mail to: @order.user.email, subject: "destroy"
	end
end
