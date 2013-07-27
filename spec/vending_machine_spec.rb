require 'vending_machine'

describe VendingMachine do
	before :each do
		@vending_machine = VendingMachine.new
	end

	context "that put acceptable coins" do
		before :each do
			@coins = [10, 50, 100, 500, 1000]
		end

		it "should not return coin" do
			@coins.each do |coin|
				expect(@vending_machine.put coin).to eq 0
			end
		end

		it "should amount all coins" do
			@coins.each do |coin|
				@vending_machine.put coin
			end
			expect(@vending_machine.amounts).to eq 1660
		end

		context "when cancelled" do
			before :each do
				@coins.each do |coin|
					@vending_machine.put coin
				end
			end

			it "should return all coins" do
				expect(@vending_machine.cancel).to eq 1660
			end
		end
	end

	context "that put unacceptable coins" do
		before :each do
			@coins = [1, 5, 2000, 5000, 10000]
		end

		it "should return coin" do
			@coins.each do |coin|
				expect(@vending_machine.put coin).to eq coin
			end
		end

		it "should have no coin" do
			@coins.each do |coin|
				@vending_machine.put coin
			end
			expect(@vending_machine.amounts).to eq 0
		end
	end

	context "#info" do
		it "should return items" do
			expect(@vending_machine.items).to eq [{name: 'cola', price: 120, quantity: 5}]
		end
	end

end
