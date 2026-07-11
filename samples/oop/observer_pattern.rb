# frozen_string_literal: true
# Observer pattern: a subject notifies a list of subscriber callables.
# Inference: an Array(Proc) of subscribers is iterated and each called with the
# event payload; storing and invoking callables from a container stresses Proc typing.

class Subject
  def initialize
    @observers = []
    @log = []
  end

  def subscribe(&block)
    @observers << block
    self
  end

  def emit(event)
    @observers.each { |obs| obs.call(event) }
  end

  def record(msg)
    @log << msg
  end

  attr_reader :log
end

subject = Subject.new
subject.subscribe { |e| subject.record("A saw #{e}") }
subject.subscribe { |e| subject.record("B saw #{e * 2}") }

subject.emit(5)
subject.emit(10)

puts subject.log
p subject.log.length
p subject.log.count { |m| m.start_with?("A") }
