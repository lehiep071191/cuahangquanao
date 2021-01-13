class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy, :correct_user]
  before_action :correct_user, only: [:show, :update]
  def index
    @orders = current_user.orders
  end
  def new
    if current_cart.cart_products.any?
    	@order = Order.new
    	@order.order_items.new
    else
      redirect_to root_url  
    end
  end
  def create
    if current_cart.cart_products.any?
      pr = order_params.merge(status: params[:status].to_i)
    	@order = Order.new(pr)
    	if @order.save!
        OrderMailer.order(@order).deliver_now
    		current_cart.destroy
    		session[:cart_id] = nil
    		cookies.signed[:cart_id] = nil
    		redirect_to @order
    	end	
    end
  end
  def update
    if (@order.status != "Cancelseller" && @order.status != "Shipping" && @order.status != "Delivered" && @order.status != "Refunded" && @order.status != "Cancelbuyer")
      @order.update(status: params[:status].to_i)
      render json: {
        data_success: true,
        data_cancel: @order.status
      }, status: :ok
    else  
      render json: {
        data_success: false,
        data_noitice: "bạn không thể huy đơn hàng vì sản phẩm đã #{@order.status}"
      }
    end 
  end
  def show
    
  end
  private
  def order_params
  	params.require(:order).permit(:username,:user_id ,:address, :phone, :status, order_items_attributes:[:product_id, :order_id, :quantity])
  end
  def set_order
    @order = Order.find_by id: params[:id]
    if @order.nil?
      redirect_to root_url
    end  
  end
  def correct_user
    redirect_to root_url unless current_user.current_user?(@order.user)
  end
end
