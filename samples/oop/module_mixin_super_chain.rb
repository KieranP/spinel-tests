# frozen_string_literal: true
# A document-rendering stack assembled from modules: each mixin decorates `render`
# and calls `super`, so the output depends on the ancestor order that `include`,
# `prepend` and `extend` produce. The run prints each class's ancestry alongside the
# rendered result, so a wrong linearisation shows up as wrong text, not just wrong
# introspection.
# Inference: `super` dispatch through a chain of modules with no explicit receiver,
# self-type flowing through each decorator, and a module method whose return type is
# only fixed once the whole chain is linearised.

module Renderable
  def render(text) = text

  def describe = "#{self.class.name}: #{ancestry.join(" < ")}"

  def ancestry = self.class.ancestors.take_while { |m| m != Object }.map { |m| m.name.to_s }
end

module Trimmed
  def render(text) = super(text.strip)
end

module Bracketed
  def render(text) = "[#{super}]"
end

module Shouted
  def render(text) = super.upcase
end

module Numbered
  def initialize(*args)
    super()
    @counter = 0
  end

  def render(text)
    @counter += 1
    "#{@counter}. #{super}"
  end
end

class Plain
  include Renderable
end

class Fancy
  include Renderable
  include Trimmed
  include Bracketed
end

class Loud
  include Renderable
  include Trimmed
  prepend Shouted
end

class Listing
  include Renderable
  include Trimmed
  include Numbered
end

class Everything
  include Renderable
  include Trimmed
  include Bracketed
  include Numbered
  prepend Shouted
end

SAMPLE = "  hello mixin world  "

puts "== ancestry =="
[Plain, Fancy, Loud, Listing, Everything].each do |klass|
  chain = klass.ancestors.take_while { |m| m != Object }.map { |m| m.name.to_s }
  puts format("  %-11s %s", klass.name, chain.join(" < "))
end

puts
puts "== rendering the same text through each stack =="
[Plain, Fancy, Loud, Listing, Everything].each do |klass|
  puts format("  %-11s %p", klass.name, klass.new.render(SAMPLE))
end

puts
puts "== a Numbered instance counts across calls =="
listing = Listing.new
3.times { |i| puts "  #{listing.render("  item #{i}  ")}" }

puts
puts "== prepend really goes in front =="
puts "Loud.ancestors.first: #{Loud.ancestors.first}"
puts "Fancy.ancestors.first: #{Fancy.ancestors.first}"
puts "Shouted before Loud: #{Loud.ancestors.index(Shouted) < Loud.ancestors.index(Loud)}"
puts "Trimmed after Fancy: #{Fancy.ancestors.index(Trimmed) > Fancy.ancestors.index(Fancy)}"

puts
puts "== include? and instance checks =="
fancy = Fancy.new
puts "Fancy.include?(Trimmed): #{Fancy.include?(Trimmed)}"
puts "Fancy.include?(Shouted): #{Fancy.include?(Shouted)}"
puts "fancy.is_a?(Renderable): #{fancy.is_a?(Renderable)}"
puts "fancy.is_a?(Bracketed): #{fancy.is_a?(Bracketed)}"
puts "fancy.kind_of?(Fancy): #{fancy.kind_of?(Fancy)}"
puts "Bracketed instance methods: #{Bracketed.instance_methods(false).sort.inspect}"

puts
puts "== extend gives one object its own chain =="
loner = Plain.new
puts "before extend: #{loner.render(SAMPLE).inspect}"
loner.extend(Bracketed)
puts "after extend:  #{loner.render(SAMPLE).inspect}"
puts "a sibling is unaffected: #{Plain.new.render(SAMPLE).inspect}"
puts "the extended object is_a?(Bracketed): #{loner.is_a?(Bracketed)}"
puts "a sibling is not: #{Plain.new.is_a?(Bracketed)}"
puts "the class does not gain it: #{Plain.include?(Bracketed)}"

puts
puts "== module_function style helpers =="
module Casing
  module_function

  def snake(text) = text.strip.downcase.gsub(/\s+/, "_")
  def kebab(text) = snake(text).tr("_", "-")
end

puts "snake: #{Casing.snake(SAMPLE).inspect}"
puts "kebab: #{Casing.kebab(SAMPLE).inspect}"

puts
puts "== a module constant and a nested module =="
module Layout
  WIDTH = 24

  module Border
    def self.wrap(text) = "|#{text.center(WIDTH - 2)}|"
  end
end

puts "WIDTH: #{Layout::WIDTH}"
puts Layout::Border.wrap("centred")
puts "nesting name: #{Layout::Border.name}"
puts "constants: #{Layout.constants.sort.inspect}"

puts
puts "== comparing modules =="
puts "Fancy < Renderable: #{Fancy < Renderable}"
puts "Renderable < Fancy: #{(Renderable < Fancy).inspect}"
puts "Fancy <= Fancy: #{Fancy <= Fancy}"
puts "Trimmed and Bracketed unrelated: #{(Trimmed <=> Bracketed).inspect}"
