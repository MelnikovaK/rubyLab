# A base class for a deposit
class Deposit
  attr_reader :type, :percent, :pos_of_replenishment

  def initialize(type, percent, pos_of_replenishment)
    @type = type.capitalize
    @percent = percent.to_f
    @pos_of_replenishment = pos_of_replenishment
  end
end
