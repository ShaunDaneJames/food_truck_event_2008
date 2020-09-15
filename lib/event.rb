class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def quantity_of_items
    item_count = Hash.new(0)
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item|
        item_count[:quantity] += item[1] if item == item
      end
    end
    # require "pry"; binding.pry
  end

  # def total_inventory
  #   available_inventory = Hash.new {|h, k| h[k] = {} }
  #   quantity = Hash.new
  #   @food_trucks.each do |food_truck|
  #     food_truck.inventory.each do |item|
  #       available_inventory[item] = food_trucks_that_sell(item)
  #       # available_inventory[item] = quantity[item[-1]]
  #       require "pry"; binding.pry
  #     end
  #   end
  #   available_inventory
  # end
end
