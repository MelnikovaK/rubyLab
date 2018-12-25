require_relative 'deposit'
require 'csv'

# The array of deposits
class Deposits
  def initialize(deposits = [])
    @deposits = deposits
  end

  def read_csv_file(filename)
    CSV.foreach(filename, headers:true) do |row|
      puts "#{row['repl']}"
      if row['repl'] === 'true'
        repl = true
      else
        repl = false
      end
      @deposits.append(Deposit.new(row['type'], row['percent'], repl))
    end
  end

  def self.init_from_file
    deposits = Deposits.new
    deposits.read_csv_file(File.expand_path('../data/input1.csv', __dir__))
    deposits
  end

  def each
    return enum_for(:each) unless block_given?
    @deposits.each do |dep|
      yield dep
    end
  end

  def add(deposit)
    @deposits.append(deposit)
  end

  def delete_deposit(index)
    @deposits.delete_at(index)
  end

  def get_deposit_by_type(type)
    deposit = ''
    @deposits.each do |dep|
      deposit = dep if dep.type == type
    end
    deposit
  end

  def [](index)
    @deposits[index]
  end

  def by_index(index)
    @deposits[index]
  end
end
