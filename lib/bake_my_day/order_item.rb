# Each order item (object) as requested by user
require_relative 'menu'
require_relative 'pack'

class OrderItem
	# attr_reader :requested_quantity # requested item (object) Item class
	# attr_reader :menu_item # requested item (object) Item class
	# attr_reader :packs # type: Pack breakdown of requested item into packages, this is an array of the OrderPackage class
	# attr_reader :item_total # total cost for all packs in this item


	def initialize(quantity, item_code)
		@requested_quantity = quantity
		@menu_item = Menu.instance.get_item_instance_from_code(item_code)
		@menu_item_index = Menu.instance.get_index_from_code(item_code).to_i
		@packs = Array.new
		@item_total = 0.00
		@remaining_units = @requested_quantity

		add_packs()
		display()
	end

	def packages_for_this_item
		# sort in descending order according to number of units. We want to get the biggest pack first
		Menu.instance.items[@menu_item_index].packages.sort_by {|pack_units, pack_price| pack_price}.reverse
	end

	def add_packs()	
		packages_for_this_item.each do |pack_units, pack_price|
			# If there are more remaining units than in this package, create a pack and see how many packs you need.
			if @remaining_units > pack_units
				# How many packs of this package?
				num_of_packs = @remaining_units / pack_units
				@item_total += num_of_packs * pack_price

				# How much remains after we move those units to those packs?
				@remaining_units -= (num_of_packs * pack_units)
			
				pack = Pack.new(num_of_packs,pack_units,pack_price,@item_total)
				@packs.push(pack)

			end

		end

		if @remaining_units > 0
			Tracer.flash "\nExtra Remaining Unit: " + @remaining_units.to_s + " that cannot be grouped into a pack."
		end
	end

	def display
		Tracer.flash (@requested_quantity.to_s + " of " + @menu_item.description.to_s + " (" + @menu_item.code.to_s + ") at $ " + @item_total.to_s)
		@packs.each do |pack|
			pack.display
		end
	end
end