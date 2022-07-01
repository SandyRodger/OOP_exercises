=begin

Refactor these classes so they all use a common superclass, and inherit behavior as needed.

=end

class Vehicle
	attr_reader :make, :model, :wheels

	def initialize(make, model)
    @make = make
    @model = model
  end

	def to_s
    "#{make} #{model}, #{wheels} wheels"
  end

end

class Car < Vehicle
	WHEELS = 4
	def initialize(make, model)
		super(make, model)
		@wheels = WHEELS
  end
end

class Motorcycle < Vehicle
	WHEELS = 2
	def initialize(make, model)
		super(make, model)
		@wheels = WHEELS
  end
end

class Truck < Vehicle
  attr_reader :payload
	WHEELS = 6
  def initialize(make, model, payload)
		super(make, model)
    @payload = payload
		@wheels = WHEELS
  end
end

truck_1 = Truck.new('Transit', 'Unicorn', 'diapers')
puts truck_1
car_1 = Car.new('Ford','Fiesta')
puts car_1
motorcycle_1 = Motorcycle.new('Kowasaki', 'speedy-boy')
puts motorcycle_1.wheels

=begin

I wanted to move the intitialization of wheels into a module, but couldn't find a way to do that.
Here is Launch School's solution/discusion:

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

 Discussion
Our first task is to decide on an appropriate class name for our superclass. It should be a more general type than the individual class names. A good name here is Vehicle, since cars, motorcycles, and trucks are all types of vehicles.

All of our initializers take make and model parameters, and store them in @make and @model instance variables. We can refactor all of this commonality into Vehicle by moving initialize from one of the classes into Vehicle, and deleting it from both Car and Motorcycle. However, our Truck class takes a 3rd parameter payload, so we can't just delete Truck#initialize. We can (and should!) simplify it a bit by using super to initialize the superclass.

By similar reasoning, we can also move our attr_reader for :make and :model into Vehicle, but we need to remember to keep the :payload attr_reader defined in Truck.

Our to_s method is identical in all 3 of the original classes, so we just move that into Vehicle and remove it from the original classes.

The wheels method is different in each of the original classes, so we don't move this into Vehicle.

Further Exploration
Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not? If you think it does make sense, what method body would you write?

In the code below I initially tried to make number of wheels into constants specific to the vehicle subclasses, but I can't find a way to pass them to a method in a superclass while retaining the constants in the subclass. For this reason I think its' not a feasable approach.

=end

# class Vehicle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def to_s
#     "#{make} #{model}"
#   end

# 	def wheels(num)
#     num
#   end
# end

# class Car < Vehicle
# 	CAR_WHEELS = 4
# end

# class Motorcycle < Vehicle
# MOTORCYCLE_WHEELS = 2
# end

# class Truck < Vehicle
#   attr_reader :payload
# 	TRUCK_WHEELS = 6

#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end


# end

# truck_1 = Truck.new('blah','blooh','form')
# puts truck_1.wheels(TRUCK_WHEELS)