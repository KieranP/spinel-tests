# frozen_string_literal: true
# A turnstile finite-state machine driven by a stream of Symbol events.
# Inference: state and event are Symbols routed through a case; the machine
# folds a sequence of events into a final state plus counters.

class Turnstile
  attr_reader :state, :fare_collected, :violations

  def initialize
    @state = :locked
    @fare_collected = 0
    @violations = 0
  end

  def send_event(event)
    case [@state, event]
    in [:locked, :coin]
      @state = :unlocked
      @fare_collected += 5
    in [:locked, :push]
      @violations += 1
    in [:unlocked, :push]
      @state = :locked
    in [:unlocked, :coin]
      @fare_collected += 5
    end
    @state
  end
end

gate = Turnstile.new
events = [:push, :coin, :push, :coin, :coin, :push, :push]
trace = events.map { |e| gate.send_event(e) }

p trace
p gate.state
p gate.fare_collected
p gate.violations
