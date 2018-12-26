# A base class for a depositor
class Depositor
  attr_reader :last_name, :first_name, :middle_name, :dep_number,
              :dep_type, :dep_amount, :opening_date
  attr_writer :dep_amount, :opening_date

  def initialize(last_name, first_name, middle_name, dep_number,
                 dep_type, dep_amount, opening_date)
    @last_name = last_name.capitalize
    @first_name = first_name.capitalize
    @middle_name = middle_name.capitalize
    @dep_number = dep_number.to_i
    @dep_type = dep_type.capitalize
    @dep_amount = dep_amount.to_i
    @opening_date = opening_date.to_i
  end
end
