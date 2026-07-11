# frozen_string_literal: true
# Keyword arguments, defaults, and double-splat forwarding.
# Inference: methods with required/optional keywords and **rest must thread the
# keyword hash through calls and forwarding without losing value types.

def greet(name:, greeting: "Hello", punct: "!")
  "#{greeting}, #{name}#{punct}"
end

def rectangle(width:, height:)
  width * height
end

def forward(**opts)
  greet(**opts)
end

p greet(name: "Ada")
p greet(name: "Bob", greeting: "Hi")
p greet(name: "Cy", greeting: "Hey", punct: ".")
p rectangle(width: 4, height: 5)

opts = { name: "Dee", greeting: "Yo" }
p greet(**opts)
p forward(name: "Eve", punct: "?")

configs = [{ width: 2, height: 3 }, { width: 5, height: 5 }]
p configs.map { |c| rectangle(**c) }
