# Summary of order items and their order breakdowns
require_relative 'order_item'

class Order
	attr_reader :order_items, :date_of_order, :order_total

	def initialize
		@order_items = Array.new
		@date_of_order = DateTime.now
		@order_total = 0.00
	end

	def add_item_to_order(input)
		item_to_add = OrderItem.new(input.quantity, input.item_code)
		if item_to_add.found
			@order_items.push(item_to_add)
			@order_total += item_to_add.item_total
			Tracer.debug "\n\tAdded " + input.quantity.to_s + " of " + input.item_code.to_s + " to order."
			display_items()
		end
	end

	def display_items
		@order_items.each do |order_item|
			order_item.display()
		end

		Tracer.flash "\nTotal for this order: " + @order_total.round(2).to_s
	end
end