# frozen_string_literal: true
# Event dispatcher: procs stored in a hash, dispatched by key
class Dispatcher
  def initialize
    @handlers = Hash.new { |h, k| h[k] = [] }
  end

  def on(event, &block)
    @handlers[event] << block
  end

  def emit(event, *args)
    @handlers[event].map { |h| h.call(*args) }
  end
end

d = Dispatcher.new
log = []
d.on(:login)  { |user| log << "#{user} logged in" }
d.on(:login)  { |user| "welcome #{user}" }
d.on(:logout) { |user| log << "#{user} logged out" }

p d.emit(:login, "alice")
p d.emit(:logout, "bob")
p d.emit(:unknown, "x")
p log
