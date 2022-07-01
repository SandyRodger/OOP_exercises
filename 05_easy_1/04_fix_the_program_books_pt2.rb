class Book
	attr_accessor :author, :title
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.) # => The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.)                                  # => book = "Snow Crash", by Neil Stephenson.

=begin

Further Exploration

What do you think of this way of creating and initializing Book objects? (The two steps are separate.) Would it be better to create and initialize at the same time like in the previous exercise? What potential problems, if any, are introduced by separating the steps?

Creating an initializing a tthe same time is quicker, but separating the steps grants greater control. Seperate setter methods allows individual instance variables to be reassigned, without disturbing the other. 

=end