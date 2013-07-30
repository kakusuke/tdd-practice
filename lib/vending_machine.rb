class VendingMachine
	def initialize
		@proceeds = 0
	end

	def put(coin)
		return coin unless [10, 50, 100, 500, 1000].include? coin

		coins.push(coin)
		0
	end

	def amounts
		coins.reduce(0) {|sum, coin| sum + coin} - proceeds
	end

	def cancel
		amounts
	end

	def items
		@items ||= [Item.new('coke', price: 120, quantity: 5)]
	end

	def buy?(name)
		items[0].price <= amounts && items[0].quantity > 0
	end

	def buy(name)
		return unless buy? name

		@proceeds += items[0].price
		items[0].quantity -= 1
	end

	def proceeds
		@proceeds
	end

	private
	def coins
		@coins ||= []
	end

	class Item
		attr_accessor :name, :price, :quantity

		def initialize(name, price: 120, quantity: 0)
			@name = name
			@price = price
			@quantity = quantity
		end
	end
end
