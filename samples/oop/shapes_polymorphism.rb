# frozen_string_literal: true
# Duck-typed polymorphism: unrelated shape classes each answer #area and #name.
# Inference: a heterogeneous Array of shapes forces polymorphic dispatch — the
# whole-program view must union the concrete types at each call site.

class Circle
  def initialize(r) = @r = r
  def area = 3.14159 * @r * @r
  def name = "circle"
end

class Rectangle
  def initialize(w, h)
    @w = w
    @h = h
  end
  def area = @w * @h.to_f
  def name = "rectangle"
end

class Triangle
  def initialize(b, h)
    @b = b
    @h = h
  end
  def area = 0.5 * @b * @h
  def name = "triangle"
end

shapes = [Circle.new(2), Rectangle.new(3, 4), Triangle.new(6, 8)]

shapes.each { |s| puts "#{s.name}: #{s.area.round(3)}" }
p shapes.sum { |s| s.area }.round(3)
p shapes.max_by { |s| s.area }.name
