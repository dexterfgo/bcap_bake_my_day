class Item

	attr_reader :code, :description
	attr_accessor :packages

	def initialize(code, desc)
		@code = code
		@description = desc
		@packages = Hash.new
	end

	def add_package_for_code(quantity, price)
		@packages.store(quantity, price)
	end

end

