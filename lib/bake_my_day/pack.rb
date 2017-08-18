# Class to hold an object for each pack/breakdown

require_relative 'menu'

class Pack
	attr_reader :number_of_packs # number of packs on this 
	attr_reader :number_of_units_per_pack # units for each pack (as in menu or just the remainder)
	attr_reader :cost_per_pack # cost_per_pack as in menu
	attr_reader :total_cost_for_number_of_packs # cost_per_pack x number_of_packs

	def initialize(number_of_packs, number_of_units_per_pack, cost_per_pack, total_cost_for_number_of_packs)
		@number_of_packs = number_of_packs
		@number_of_units_per_pack = number_of_units_per_pack
		@cost_per_pack = cost_per_pack
		@total_cost_for_number_of_packs = total_cost_for_number_of_packs

		Tracer.debug "\nPack.new: { number of packs: " + @number_of_packs.to_s + \
			", cost per pack of (" + @number_of_units_per_pack.to_s + "): " + @cost_per_pack.to_s + \
			", total cost for: " + @number_of_packs.to_s + " packs: " + @total_cost_for_number_of_packs.to_s + \
			" }\n"
	end

	def display
		Tracer.flash "\t\t"+ @number_of_packs.to_s + " x " + @number_of_units_per_pack.to_s \
		 + "-pack at $" + @cost_per_pack.to_s + \
		 " a pack with total: " + @total_cost_for_number_of_packs.round(2).to_s
		# puts "#{quantity} at $ #{price}"
	end
end