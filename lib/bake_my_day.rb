require_relative "bake_my_day/version"
require_relative "bake_my_day/item"
require_relative "bake_my_day/order"
require_relative "bake_my_day/menu"
require_relative "bake_my_day/tracer"
require_relative "bake_my_day/input"


module BakeMyDay

	# Display menu at least once
	Menu.instance.setup
	Menu.instance.display_menu

	# maybe move this down?
	order = Order.new

	# Endlessly request for input unless an exit is requested
	loop do
		begin
			Tracer.prompt "\n[Quantity]<space>[Item Code] >> "
		    terminal = STDIN.gets
		rescue Interrupt
			terminal = "exit"
			break
		end
		# If exit is typed, end simulation.
		break if terminal =~ /^\s*exit\s+/

		# Not "exit"? Parse input.
		input = Input.new(terminal.strip.upcase)
		order.add_item_to_order(input)
		order.display
	end
end
