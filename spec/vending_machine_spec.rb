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

	context "#items" do
		it "should return items" do
			expect(@vending_machine.items.length).to eq 1
			expect(@vending_machine.items[0].name).to eq 'coke'
			expect(@vending_machine.items[0].price).to eq 120
			expect(@vending_machine.items[0].quantity).to eq 5
		end
	end

	describe "#buy?" do
		before :each do
			@vending_machine.put 100
			@vending_machine.items[0].price = 100
		end

		it "should return true when vending machine has enough money" do
			@vending_machine.items[0].price = 100
			expect(@vending_machine.buy? 'coke').to be true
		end

		it "should return false when vending machine does not have enough money" do
			@vending_machine.items[0].price = 110
			expect(@vending_machine.buy? 'coke').to be false
		end

		it "should return false when vending machine has enough stock" do
			@vending_machine.items[0].quantity = 5
			expect(@vending_machine.buy? 'coke').to be true
		end

		it "should return false when vending machine does not have enough stock" do
			@vending_machine.items[0].quantity = 0
			expect(@vending_machine.buy? 'coke').to be false
		end
	end

	describe "#buy" do
		before :each do
			@vending_machine.put 1000
			@vending_machine.items[0].price = 120
			@vending_machine.items[0].quantity = 2
		end

		context "when #buy? returns true" do
			before :each do
				allow(@vending_machine).to receive(:buy?).and_return(true)
			end

			it "should decrease 120 yen from amounts when coke is bought" do
				@vending_machine.buy 'coke'
				expect(@vending_machine.amounts).to eq 880
			end

			it "should decrease 1 from quantity of coke when coke is bought" do
				@vending_machine.buy 'coke'
				expect(@vending_machine.items[0].quantity).to eq 1
			end
		end

		context "when #buy? returns false" do
			before :each do
				allow(@vending_machine).to receive(:buy?).and_return(false)
			end

			it "should not decrease any money from amounts when coke is bought" do
				@vending_machine.buy 'coke'
				expect(@vending_machine.amounts).to eq 1000
			end

			it "should not decrease any count from quantity of coke when coke is bought" do
				@vending_machine.buy 'coke'
				expect(@vending_machine.items[0].quantity).to eq 2
			end
		end
	end

	describe "#proceeds" do
		before :each do
			@vending_machine.put 1000
			@vending_machine.items[0].price = 120
			@vending_machine.items[0].quantity = 2
			allow(@vending_machine).to receive(:buy?).and_return(true)
		end

		it "should return 120 yen when a coke was bought" do
			@vending_machine.buy 'coke'
			expect(@vending_machine.proceeds).to eq 120
		end

		it "should return 240 yen when two cokes were bought" do
			2.times.each do
				@vending_machine.buy 'coke'
			end
			expect(@vending_machine.proceeds).to eq 240
		end

	end

	describe "#cancel" do
		context "when two cokes were bought" do
			before :each do
				@vending_machine.put 1000
				@vending_machine.items[0].price = 120
				@vending_machine.items[0].quantity = 2
				allow(@vending_machine).to receive(:buy?).and_return(true)

				2.times.each do
					@vending_machine.buy 'coke'
				end
			end

			it "should return 760 yen" do
				expect(@vending_machine.cancel).to eq 760
			end

		end
	end

end
