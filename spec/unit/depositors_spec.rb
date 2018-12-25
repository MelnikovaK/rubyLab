# frozen_string_literal: true

require 'depositors'

RSpec.describe Depositors do
  before do
    @depositor = Depositor.new('Ivanov', 'Ivan', 'Ivanovich', 1234,
                               'Super', 34000, 2017)
    @depositor1 = Depositor.new('Petrov', 'Ivan', 'Ivanovich', 3444,
                               'Travel', 5000, 2010)
    @depositor2 = Depositor.new('Melnikov', 'Petr', 'Ivanovich', 4555,
                               'Travel', 3000, 2010)
  end
  # describe '#read_from_file' do
  #   it 'should read depositors from correct file' do
  #     list = Depositors.new
  #     file_name = 'non-existent'
  #     expect(File).to receive(:readlines).with(file_name).and_return(['1/2', '2/5'])
  #     list.read_from_file(file_name)
  #     expect(list.each.to_a).to eq([Depositor.new(1, 2)])
  #   end
  # end

  describe '#add' do
    it 'should add depositor' do
      dep_list = Depositors.new
      dep_list.add(@depositor)
      expect(dep_list[0]).to eq(@depositor)
    end
  end

  describe '#delete_depositor' do
    it 'should delete depositor by index' do
      dep_list = Depositors.new
      index = 0
      dep_list.add(@depositor)
      dep_list.delete_depositor(0)
      expect(dep_list[0]).to eq(nil)
    end
  end

  describe '#by_index' do
    it 'should return depositor by index' do
      dep_list = Depositors.new
      index = 0
      dep_list.add(@depositor)
      expect(dep_list.by_index(index)).to eq(@depositor)
    end
  end

  describe '#delete_dep' do
    it 'should delete depositor by deposit number' do
      dep_list = Depositors.new
      dep_list.add(@depositor)
      dep_list.delete_dep(@depositor.dep_number)
      expect(dep_list[0]).to eq(nil)
    end
  end

  describe '#get_depositor_by_lastname' do
    it 'should return the depositor which name is input' do
      ped_list = Depositors.new
      ped_list << @depositor
      expect(ped_list.get_depositor_by_lastname('Ivanov')).to eq(@depositor)
    end
  end

  describe '#get_depositor_by_dep_num' do
    it 'should return the depositor which dep number is input' do
      ped_list = Depositors.new
      ped_list << @depositor
      expect(ped_list.get_depositor_by_dep_num(1234)).to eq(@depositor)
    end
  end

  describe 'sort_by_lastname' do
    it 'should sort by lastname' do
      dep_list = Depositors.new
      dep_list.add(@depositor1)
      dep_list.add(@depositor)
      expect(dep_list.sort_by_lastname).to eq([@depositor, @depositor1])
    end
  end

  describe 'get_dep_by_diap' do
    it 'should return list of depositors that deposit amount in input range' do
      dep_list = Depositors.new
      dep_list << @depositor
      dep_list << @depositor1
      dep_list << @depositor2
      expect(dep_list.get_dep_by_diap(2500, 5000)).to eq(@depositor1, @depositor2)
    end
  end
end
