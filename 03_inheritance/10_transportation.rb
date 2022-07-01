module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

# this is an example of namespacing
# We can instantiate a class contained within a module with the following:
truck_1 = Transportation::Truck.new
p truck_1