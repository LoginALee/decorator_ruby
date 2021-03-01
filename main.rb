class Player
  def fly
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def read_mind
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class PlayerOne < Player
  def fly
    "I can't fly yet :( "
  end

  def read_mind
    "I can't read minds yet :("
  end
end

class Decorator < Player
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def fly
    @component.fly
  end

  def read_mind
    @component.read_mind
  end
end

class PlayerWithWings < Decorator
  def fly
    "Im flying with wings! (#{@component.fly})"
  end
end

class PlayerWithMindReading < Decorator
  def read_mind
    "I know what you are thinking! (#{@component.read_mind})"
  end
end

def game_code(component)
  puts "RESULT: #{component.fly}"
  puts "RESULT: #{component.read_mind}"
end

simple = PlayerOne.new
puts ' I\'ve got a simple Player:'
game_code(simple)

puts "\n"

decorator1 = PlayerWithWings.new(simple)
decorator2 = PlayerWithMindReading.new(decorator1)
puts 'Now I\'ve got a decorated Player:'
game_code(decorator2)
