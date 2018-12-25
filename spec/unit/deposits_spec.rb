# frozen_string_literal: true

require 'deposits'

RSpec.describe Deposits do
	before do
		@deposit = Deposit.new('Travel', 4, true)
		@deposit1 = Deposit.new('Super', 10, false)
	end
	describe '#delete_deposit' do
		it 'should delete deposit by index' do
			ped_list = Deposits.new
			ped_list.add(@deposit)
			ped_list.delete_deposit(0)
			expect(ped_list[0]).to eq(nil)
		end
	end

	describe '#get_deposit_by_type' do
		it 'should return the deposit which type is input' do
			ped_list = Deposits.new
			ped_list.add(@deposit1)
			ped_list.add(@deposit)
			expect(ped_list.get_deposit_by_type('Super')).to eq(@deposit1)
		end
	end

	describe '#add' do
    it 'should add deposit' do
      dep_list = Deposits.new
      dep_list.add(@deposit)
      expect(dep_list[0]).to eq(@deposit)
    end
	end
	
	describe '#by_index' do
    it 'should return deposit by index' do
      dep_list = Deposits.new
      index = 0
      dep_list.add(@deposit)
      expect(dep_list.by_index(index)).to eq(@deposit)
    end
  end
end
