class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items
	enum status: {"Awaiting" =>0, "Cancelseller" => 1, "Accepted" => 2, "Processing" => 3,
            "Shipping" => 4, "Delivered" => 5, "Refunded" => 6,"Cancelbuyer"=>7} 
	def subtotal
		order_items.collect {|order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
	end
	private
	def set_subtotal
		self[:subtotal] = subtotal
	end
end
