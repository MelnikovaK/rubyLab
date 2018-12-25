# frozen_string_literal: true

require_relative 'depositor'

# The array of depositors
class Depositors
  def initialize(depositors = [])
    @depositors = depositors
  end

  def read_csv_file(filename)
    CSV.foreach(filename, headers:true) do |row|
      @depositors.append(Depositor.new(row['l_name'], row['f_name'], row['m_name'], row['dep_number'],
                                   row['dep_type'], row['dep_amount'], row['opening_date']))
    end
  end

  def self.init_from_file
    depositors = Depositors.new
    depositors.read_csv_file(File.expand_path('../data/input2.csv', __dir__))
    depositors
  end

  def add(depositor)
    @depositors.append(depositor)
  end

  def <<(depositor)
    @depositors << depositor
  end

  def each
    return enum_for(:each) unless block_given?
    @depositors.each do |dep|
      yield dep
    end
  end

  def delete_depositor(index)
    @depositors.delete_at(index)
  end

  def [](index)
    @depositors[index]
  end

  def by_index(index)
    @depositors[index]
  end
  
  def delete_dep(num)
    dep_list = []
    @depositors.each do |dep|
      dep_list << dep if dep.dep_number != num
    end
    @depositors = dep_list
  end

  def get_depositor_by_lastname(lastname)
    depositor = ''
    @depositors.each do |dep|
      depositor = dep if dep.last_name == lastname
    end
    depositor
  end

  def get_depositor_by_dep_num(num)
    depositor = ''
    @depositors.each do |dep|
      depositor = dep if dep.dep_number == num
    end
    depositor
  end

  def sort_by_lastname
    @depositors = @depositors.sort_by(&:last_name)
  end

  def get_dep_by_diap(l_range, u_range)
    dep_list = Depositors.new
    @depositors.each do |dep|
      dep_list << dep if dep.dep_amount >= l_range && dep.dep_amount <= u_range
    end
    dep_list
  end
end
