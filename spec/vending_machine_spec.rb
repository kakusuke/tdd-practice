require 'vending_machine'

describe VendingMachine do
	before :each do
		@vending_machine = VendingMachine.new
	end

	describe "#put" do
		[10, 50, 100, 500, 1000].each do |coin|
			it "should not return coin" do
				expect(@vending_machine.put coin).to eq 0
				expect(@vending_machine.amounts).to eq coin
			end
		end
		[1, 5, 2000, 5000, 10000].each do |coin|
			it "should return coin" do
				expect(@vending_machine.put coin).to eq coin
				expect(@vending_machine.amounts).to eq 0
			end
		end
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
