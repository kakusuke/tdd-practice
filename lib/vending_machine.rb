class VendingMachine
	def put(coin)
		coins.push(coin)
	end

	def amounts
		coins.reduce {|sum, coin| sum + coin}
	end

	def cancel
		amounts
	end

	private
	def coins
		@coins ||= []
	end
end
