class FoodTruck
  attr_reader :name,
              :inventory,
              :check_stock

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end
end
