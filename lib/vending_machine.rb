class VendingMachine
	def put(coin)
		@coins ||= []
		@coins.push(coin)
	end

	def display
		@coins.reduce {|sum, coin| sum + coin}
	end

	def cancel
		display
	end
end
