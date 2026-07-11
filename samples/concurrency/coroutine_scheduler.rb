# frozen_string_literal: true
# A cooperative round-robin scheduler built on Fibers. Each task is a Fiber that
# yields a status string after every step; the scheduler cycles the ready list,
# drops dead Fibers, and prints an interleaved trace plus a completion report.
# Inference: Fiber#resume returns either a String status or nil at completion, so
# the return value flows into both a String log and a nil-terminated loop guard.

class Task
  attr_reader :name, :log

  def initialize(name, steps)
    @name = name
    @log = []
    @fiber = Fiber.new do
      steps.each_with_index do |step, i|
        Fiber.yield("#{name}:#{i}:#{step}")
      end
      nil
    end
  end

  def step
    return nil unless @fiber.alive?
    status = @fiber.resume
    @log << status if status
    status
  end

  def alive? = @fiber.alive?
end

class Scheduler
  def initialize
    @tasks = []
    @trace = []
  end

  def add(task)
    @tasks << task
    self
  end

  def run
    ticks = 0
    until @tasks.empty?
      ready = @tasks
      @tasks = []
      ready.each do |task|
        status = task.step
        @trace << status if status
        @tasks << task if task.alive?
      end
      ticks += 1
    end
    ticks
  end

  attr_reader :trace
end

sched = Scheduler.new
a = Task.new("build", %w[fetch compile link])
b = Task.new("test", %w[unit integration])
c = Task.new("ship", %w[tag upload announce verify])
sched.add(a).add(b).add(c)

ticks = sched.run

p ticks
sched.trace.each { |line| puts line }

p a.log.length
p b.log.length
p c.log.length
p a.alive?
p b.alive?
p c.alive?
p sched.trace.length
p sched.trace.first
p sched.trace.last

# A Fiber used directly as a lazy generator, driven to exhaustion.
gen = Fiber.new do
  n = 1
  6.times do
    Fiber.yield(n)
    n *= 3
  end
  nil
end
powers = []
while (v = gen.resume)
  powers << v
end
p powers
p gen.alive?
p powers.sum
p powers.map { |n| n.to_s(3) }
