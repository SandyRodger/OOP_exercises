=begin 

class Banner
	attr_accessor :message

  def initialize(message)
		@message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
		dashes = @message.length + 2
		"+#{"-"*dashes}+"
  end

  def empty_line
		spaces = @message.length + 2
		"|#{" "*spaces}|"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')

puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+


Modify this class so new will optionally let you specify a fixed banner width at the time the Banner object is created. The message in the banner should be centered within the banner of that width. Decide for yourself how you want to handle widths that are either too narrow or too wide.

=end

class Banner
  def initialize(message,width = nil)
		@message = message
		if width != nil
			@width = width
		end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

	def long_empty_line
		"| #{' ' * @width} |"
	end

	def short_empty_line
		shortened_message = @message[0..@width]
		"| #{' ' * shortened_message.size} |"
	end

  def empty_line
		if @width && @width > @message.size
			long_empty_line
		elsif @width && @width < @message.size
			short_empty_line
		else
    	"| #{' ' * (@message.size)} |"
		end
  end

	def long_horizontal_rule
		"+-#{'-' * @width}-+"
	end

	def short_horizontal_rule
		shortened_message = @message[0..@width]
		"|-#{'-' * shortened_message.size}-|"
	end

  def horizontal_rule
		if @width && @width > @message.size
			long_horizontal_rule
		elsif @width && @width < @message.size
			short_horizontal_rule
		else
    "+-#{'-' * (@message.size)}-+"
		end
  end

	def long_message_line
		sides = ((@width - @message.length)/2) 
		if @width.odd?
			"|#{' ' * sides} #{@message}  #{' ' * sides}|"
		else
			"|#{' ' * sides}#{@message}  #{' ' * sides}|"
		end
	end

	def short_message_line
		"| #{@message[0..@width]} |"
	end

  def message_line
		if @width && @width > @message.size
			long_message_line
		elsif @width && @width < @message.size
			short_message_line
		else
    	"| #{@message} |"
		end
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 8)

puts banner