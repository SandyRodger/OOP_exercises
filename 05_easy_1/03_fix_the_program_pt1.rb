=begin

Complete this program so that it produces the expected output:

=end

class Book
	attr_reader :title, :author # this line needed to be added
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.) #=> The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) #=> book = "Snow Crash", by Neil Stephenson.

=begin
# FURTHER EXPLORATION:

Writing out the two getter methods in full wouldn't change the operation of the code. It would allow you to add functionality when the instance variable was called.

=end