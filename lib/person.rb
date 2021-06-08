class Person
  attr_reader :name, :interests, :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(item, num)
    supplies[item] += num
  end

  def can_build?(craft)
    buildable = Hash.new(0)
    craft.supplies_required.each do |supply_need, num_need|
      buildable[supply_need] += num_need
      supplies.each do |supply_have, num_have|
        buildable[supply_have.to_sym] -= num_have
      end
    end
    values_in_num = []
    buildable.values.find_all do |value|
      values_in_num = value >= 0
      end
      !values_in_num
  end
end
