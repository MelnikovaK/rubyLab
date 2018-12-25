require_relative 'deposit'
require_relative 'deposits'
require_relative 'depositor'
require_relative 'depositors'
# Processing of users actions
module QueryProcessing
  def self.calc_the_percents(depositor, deposit, cur_year)
    amount = depositor.dep_amount
    while depositor.opening_date < cur_year
      amount *= (deposit.percent * 0.01 + 1)
      cur_year -= 1
    end
    amount
  end

  def self.take_percents(depositor, deposit)
    cur_year = 2018
    amount = (calc_the_percents(depositor, deposit, cur_year) * 100).to_i.to_f/100
    depositor.opening_date = cur_year
    amount -= depositor.dep_amount 
    (amount * 100).to_i.to_f/100
  end

  def self.close_deposit(depositors, depositor, deposit)
    cur_year = 2018
    amount = calc_the_percents(depositor, deposit, cur_year)
    amount = (amount * 100).to_i.to_f/100
    depositors.delete_dep(depositor.dep_number)
    amount
  end

  def self.add_money(depositors, deposits, lastname, dep_number, sum)
    depositor = depositors.get_depositor_by_lastname(lastname.capitalize)
    depositor1 = depositors.get_depositor_by_dep_num(dep_number.to_i)
    if depositor == depositor1
      deposit = deposits.get_deposit_by_type(depositor.dep_type)
      if deposit.pos_of_replenishment === true
        depositor.dep_amount += sum.to_f
      end
    end
  end
end
