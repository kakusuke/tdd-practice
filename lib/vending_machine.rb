class VendingMachine
	def put(coin)
		return coin unless [10, 50, 100, 500, 1000].include? coin

		coins.push(coin)
		0
	end

	def amounts
		coins.reduce(0) {|sum, coin| sum + coin}
	end

	def cancel
		amounts
	end

	def items
		@items ||= [{name: 'cola', price: 120, quantity: 5}]
	end

	private
	def coins
		@coins ||= []
	end
end
