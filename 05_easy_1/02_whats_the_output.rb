=begin

What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

=end

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
# 		"My name is #{@name}."
#   end

# 	def upcase
#     @name.split.map(&:upcase!).join
# 	end
# end

# name = 'Fluffy'
# puts fluffy = Pet.new(name)
# puts fluffy.name #=> Fluffy
# puts fluffy #=> My name is Fluffy
# puts fluffy.upcase # => FLUFFY
# puts fluffy.name #=> Fluffy

# LS solution:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# FURTHER EXPLORAION:

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name # => 42
puts fluffy # => My name is 42
puts fluffy.name # => 42
puts name # 43

# My explanation:

# In line 47 local variable 'fluffy' is assigned to the return value of the Pet.new method with 42 passed in as an argument. This value is "My name is 42". 
# In line 48 the value of 'name' is increased to 43.
# In line 49 the #name method calls the class getter method and returns it to the puts method which prints 42 as a string. 43 is not printed because 'fluffy' contains the values it was assigned to at its initialization, and the 'name' local variable outside the class is not referenced.
# In line 50 the fluffy local variable is called returning the value is was assigned to in line 47. Because the initialize method in line 36 assigns instance variable @name to the return value of name.to_s, the name is returned within the string message. This is why fluffy's value is the whole string My name is 42. Again it does not reference the Local variable 'name' incremented outside of the class.
# Line 51 operates the same as like 42, totally ignoring the incremented 'name' local variable.
# In line 52 when we print out 'name' it has been incremented to 43. The #puts method prints this as a string. Because we're ot calling on the Pet class, 'to_s' does not return name in a string interpolation.