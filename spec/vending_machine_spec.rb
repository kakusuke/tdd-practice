require 'vending_machine'

describe VendingMachine do
	before :each do
		@vending_machine = VendingMachine.new
	end

	describe "#put" do
		it "should not raise error when put coins" do
			[10, 50, 100, 500, 1000].each do |coin|
				expect {@vending_machine.put coin}.not_to raise_error
			end
		end
	end

	describe "#display" do
		it "should return 30 when put 10 yen 3 times" do
			3.times.each do
				@vending_machine.put 10
			end

			expect(@vending_machine.display).to eq 30
		end

		it "should return 300 when put 100 yen 3 times" do
			3.times.each do
				@vending_machine.put 100
			end

			expect(@vending_machine.display).to eq 300
		end
	end

	describe "#cancel" do
		it "should return 30 when put 10 yen 3 times" do
			3.times.each do
				@vending_machine.put 10
			end

			expect(@vending_machine.cancel).to eq 30
		end
	end
end
