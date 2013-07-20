class VendingMachine
	def put(coin)
		if [10, 50, 100, 500, 1000].include? coin then
			coins.push(coin)
			coin = 0
		end
		coin
	end

	def amounts
		coins.reduce(0) {|sum, coin| sum + coin}
	end

	def cancel
		amounts
	end

	private
	def coins
		@coins ||= []
	end
end
