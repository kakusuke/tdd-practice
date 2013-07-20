require 'vending_machine'

describe VendingMachine do
	before :each do
		@vending_machine = VendingMachine.new
	end

	describe "#amounts" do
		[10, 50, 100, 500, 1000].each do |coin|
			it "should return 30 when put #{coin} yen 3 times" do
				3.times.each do
					@vending_machine.put coin
				end

				expect(@vending_machine.amounts).to eq coin * 3
			end
		end
	end

	describe "#cancel" do
		[10, 50, 100, 500, 1000].each do |coin|
			it "should return 30 when put #{coin} yen 3 times" do
				3.times.each do
					@vending_machine.put coin
				end

				expect(@vending_machine.cancel).to eq coin * 3
			end
		end
	end
end
