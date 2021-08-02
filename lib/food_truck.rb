class FoodTruck
  attr_reader :name,
              :inventory,
              :check_stock

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    @inventory.sum do |item, amount|
      item.price * amount 
    end
  end
end
