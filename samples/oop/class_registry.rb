# frozen_string_literal: true
# A shape factory that instantiates classes looked up from a registry Hash.
# Inference: a Class stored as a Hash value and instantiated via registry[name].new
# is a variable-held receiver — a known weak surface where the class loses its type.

class Circle
  def initialize(r) = @r = r
  def area = 3.14159 * @r * @r
  def name = "circle"
end

class Square
  def initialize(s) = @s = s
  def area = @s * @s.to_f
  def name = "square"
end

REGISTRY = { "circle" => Circle, "square" => Square }

def make(name, size)
  REGISTRY[name].new(size)
end

specs = [["circle", 2], ["square", 3], ["circle", 5]]
shapes = specs.map { |name, size| make(name, size) }

shapes.each { |s| puts "#{s.name}: #{s.area.round(2)}" }
p shapes.sum { |s| s.area }.round(2)
p shapes.map(&:name)
