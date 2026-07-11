# frozen_string_literal: true
# Traffic-light state machine using Data + pattern matching on transitions.
Transition = Data.define(:from, :event, :to)

transitions = [
  Transition.new("red", :go, "green"),
  Transition.new("green", :caution, "yellow"),
  Transition.new("yellow", :stop, "red"),
]

def step(transitions, state, event)
  transitions.each do |t|
    case t
    in { from: ^state, event: ^event, to: }
      return to
    end
  end
  state
end

state = "red"
[:go, :caution, :stop, :go].each do |ev|
  nxt = step(transitions, state, ev)
  puts "#{state} --#{ev}--> #{nxt}"
  state = nxt
end

t = transitions.first
case t
in Transition[from:, event:, to:]
  puts "deconstructed: #{from}/#{event}/#{to}"
end
