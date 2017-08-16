# Class to hold an object for each pack/breakdown

require_relative 'menu'

class Pack
	attr_reader :number_of_packs # number of packs on this 
	attr_reader :number_of_units_per_pack # units for each pack (as in menu or just the remainder)
	attr_reader :cost_per_pack # cost_per_pack as in menu
	attr_reader :total_cost_for_number_of_packs # cost_per_pack x number_of_packs

	def initialize(number_of_packs, number_of_units_per_pack, cost_per_pack, total_cost_for_number_of_packs)
		@number_of_packs = number_of_packs
		@number_of_units_per_pack = @actual_number_of_units = number_of_units_per_pack
		@cost_per_pack = cost_per_pack
		@total_cost_for_number_of_packs = total_cost_for_number_of_packs
	end

	def display
		Tracer.flash @number_of_packs.to_s + " x " + @number_of_units_per_pack.to_s \
		 + "-pack at $" + @cost_per_pack.to_s + " a pack."
		 Tracer.flash "Total: " + @total_cost_for_number_of_packs.to_s
		# puts "#{quantity} at $ #{price}"
	end
end