=begin

Complete this program so that it produces the expected output:

=end

class Person
	attr_writer :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person # => John Doe

person.first_name = 'jane'
person.last_name = 'smith'
puts person # => Jane Smith