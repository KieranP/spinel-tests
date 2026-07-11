# frozen_string_literal: true
# Validation collector: block forwarding, loop+break value, re-raise
class ValidationError < StandardError
  attr_reader :field
  def initialize(field, msg)
    @field = field
    super(msg)
  end
end

class Validator
  def initialize
    @rules = []
  end

  def rule(field, &check)
    @rules << [field, check]
    self
  end

  def validate(data)
    errors = []
    @rules.each do |field, check|
      begin
        check.call(data[field])
      rescue ValidationError => e
        errors << "#{e.field}: #{e.message}"
      end
    end
    errors
  end
end

v = Validator.new
v.rule(:name) { |n| raise ValidationError.new(:name, "blank") if n.nil? || n.empty? }
v.rule(:age)  { |a| raise ValidationError.new(:age, "must be positive") if a < 0 }

p v.validate(name: "x", age: 5)
p v.validate(name: "", age: -1)

first = loop.with_index.find { |_, i| break i * 100 if i == 3 }
p first
