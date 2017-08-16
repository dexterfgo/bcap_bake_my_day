# Summary of order items and their order breakdowns
require_relative 'order_item'

class Order
	attr_reader :order_items, :date_of_order, :order_total

	def initialize
		@order_items = Array.new
		@date_of_order = DateTime.now
	end

	def add_item_to_order(input)
		@order_items.push(OrderItem.new(input.quantity, input.item_code))
	end

	def display
		@order_items.each do |order_item|
			order_item.display()
		end
	end
end