# frozen_string_literal: true
# Shape polymorphism with inheritance and Comparable
class Shape
  include Comparable
  def area
    raise NotImplementedError
  end
  def <=>(other)
    area <=> other.area
  end
  def to_s
    "#{self.class.name}(area=#{area})"
  end
end

class Rectangle < Shape
  def initialize(w, h)
    @w = w
    @h = h
  end
  def area
    @w * @h
  end
end

class Square < Rectangle
  def initialize(s)
    super(s, s)
  end
end

class Circle < Shape
  def initialize(r)
    @r = r
  end
  def area
    (3.14 * @r * @r).round(2)
  end
end

shapes = [Rectangle.new(3, 4), Square.new(5), Circle.new(2)]
shapes.sort.each { |s| puts s }
puts shapes.max.to_s
puts(Square.new(4) > Rectangle.new(2, 3))
p shapes.map(&:area)
