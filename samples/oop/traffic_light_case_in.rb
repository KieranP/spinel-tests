# frozen_string_literal: true
# State machine using case/in with guards and alternatives
class TrafficLight
  attr_reader :state
  def initialize
    @state = :red
    @count = 0
  end
  def tick
    @count += 1
    @state = case @state
             when :red then :green
             when :green then :yellow
             when :yellow then :red
             end
    self
  end
  def to_s
    "#{@state}##{@count}"
  end
end

light = TrafficLight.new
5.times { light.tick }
puts light

def describe(event)
  case event
  in { type: :move, dx:, dy: } if dx == 0 && dy == 0
    "no movement"
  in { type: :move, dx:, dy: }
    "move by #{dx},#{dy}"
  in { type: :stop } | { type: :halt }
    "stopping"
  else
    "unknown"
  end
end

puts describe({ type: :move, dx: 0, dy: 0 })
puts describe({ type: :move, dx: 3, dy: -2 })
puts describe({ type: :halt })
puts describe({ type: :other })
