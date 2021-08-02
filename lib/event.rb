class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name  }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    total_inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if total_inventory[item].nil?
          total_inventory[item] = {
            quantity: 0,
            food_trucks: []
          }
        end
        total_inventory[item][:quantity] += quantity
        total_inventory[item][:food_trucks] << truck
      end
    end
    total_inventory
  end

  def overstocked_items
    #an item is overstocked if more than 1 truck sells it AND total quantity is > 50.
    #create an accumulator
    #iterate over the total_inventory
    #add item to the accumulator if quantity > 50 && more than 1 truck.
    overstocked_items = []
    total_inventory.each do |item, info|
     if info[:quantity] > 50 && info[:food_trucks].length > 1
       overstocked_items << item
     end
   end
   overstocked_items
  end

  def sorted_item_list
    #not happening.. not enough time yet again.
end
