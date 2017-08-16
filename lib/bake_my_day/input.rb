require_relative "tracer"

class Input
	
	attr_reader :quantity, :item_code

	def initialize(input)

		@quantity = input.split(" ").first.to_i
		@item_code = input.split(" ").at(1).to_s


		Tracer.flash "\nInput.new: { quantity: " + @quantity.to_s + \
			", item code: " + @item_code.to_s + " }\n"

	end
end