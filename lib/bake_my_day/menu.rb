require 'singleton'
require_relative 'item'

class Menu
	attr_reader :items
	include Singleton

	def initialize
		@items = Array.new
	end

	def add_item(item)
		@items.push(item)
		@items.sort_by {|q,p| p}.reverse
	end

	def display_menu
		@items.sort_by {|q,p| p}.reverse
		@items.each do |item|
			Tracer.flash ("\n" + item.code.to_s + " " + item.description.to_s)
			item.packages.each do |quantity, price| 
				Tracer.flash "\n#{quantity} at $ #{price}"
			end
		end
	end

	def search_code_in_menu(code)
		@items.find { |item| item.code == code}
	end

	def get_index_from_code(item_code)
		return @items.index(search_code_in_menu(item_code)).to_i
	end

	def get_item_instance_from_code(item_code)
		return @items[get_index_from_code(item_code)]
	end

	def add_package_for_code(item_code,quantity,price)
		item_index = get_index_from_code(item_code)
		if item_index.nil?
			Tracer.flash "\n Item with code " + code.to_s + " not yet in list.\n"
		else
			@items[item_index].packages.store(quantity,price)
		end
	end

	def setup
		# Add items
		add_item(Item.new("VS5","Vegemite Scroll"))
		add_package_for_code("VS5",3,6.99)
		add_package_for_code("VS5",5,8.99)

		add_item(Item.new("MB11","Blueberry Muffin"))
		add_package_for_code("MB11",2,9.95)
		add_package_for_code("MB11",5,16.95)
		add_package_for_code("MB11",8,24.95)

		add_item(Item.new("CF","Croissant"))
		add_package_for_code("CF",3,5.95)
		add_package_for_code("CF",5,9.95)
		add_package_for_code("CF",9,16.99)
	end
end