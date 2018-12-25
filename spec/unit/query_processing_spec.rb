# frozen_string_literal: true

require 'query_processing'

RSpec.describe QueryProcessing do
	before do
		@depositors = Depositors.new
		@deposits = Deposits.new
		@depositor = Depositor.new('Ivanov', 'Ivan', 'Ivanovich', 1234,
																'Super', 34000, 2017)
		@depositor1 = Depositor.new('Petrov', 'Ivan', 'Ivanovich', 3444,
																'Travel', 5000, 2010)
		@deposit = Deposit.new('Travel', 4, true)
		@deposit1 = Deposit.new('Super', 10, false)
	end
	context '::take_percents' do
		it 'should read csv including headers' do
			expect(QueryProcessing.take_percents(@depositor1, @deposit)).to eq(1842.84)
		end
	end

	context '::close_deposit' do
		it 'should read csv including headers' do
			@depositors.add(@depositor1)
			expect(QueryProcessing.close_deposit(@depositors, @depositor1, @deposit)).to eq(6842.84)
		end
	end

	context '::add_money' do
		it 'should add money do deposit' do
			sum = 1000
			@depositors.add(@depositor1)
			@deposits.add(@deposit)
			expect(QueryProcessing.add_money(@depositors, @deposits, @depositor1.last_name,
																			 @depositor1.dep_number, sum)).to eq(6000)
		end
	end
end