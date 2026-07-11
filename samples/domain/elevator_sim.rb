# frozen_string_literal: true
# A discrete-time elevator simulation using the SCAN (elevator) algorithm:
# requests arrive on a schedule, the car sweeps in one direction serving stops,
# and the run is scored on wait and travel time.

Request = Struct.new(:id, :at_tick, :from, :to) do
  def direction
    to > from ? :up : :down
  end

  def distance
    (to - from).abs
  end

  def to_s
    "R#{id} t#{at_tick} #{from}->#{to}"
  end
end

class Elevator
  attr_reader :floor, :direction, :log, :onboard, :completed

  def initialize(floors)
    @floors = floors
    @floor = 1
    @direction = :idle
    @waiting = []
    @onboard = []
    @completed = []
    @log = []
    @tick = 0
  end

  def submit(req)
    @waiting << req
  end

  def targets
    up = @onboard.map(&:to) + @waiting.map(&:from)
    up.uniq.sort
  end

  def step
    @tick += 1

    dropped = @onboard.select { |r| r.to == @floor }
    dropped.each do |r|
      @onboard.delete(r)
      @completed << [r, @tick]
    end

    boarded = @waiting.select { |r| r.from == @floor }
    boarded.each do |r|
      @waiting.delete(r)
      @onboard << r
    end

    @direction = choose_direction
    note = []
    note << "drop #{dropped.map(&:id).join(",")}" unless dropped.empty?
    note << "board #{boarded.map(&:id).join(",")}" unless boarded.empty?
    @log << [@tick, @floor, @direction, note.join(" ")]

    case @direction
    when :up then @floor += 1
    when :down then @floor -= 1
    end
    self
  end

  def choose_direction
    pending = targets
    return :idle if pending.empty?

    above = pending.select { |f| f > @floor }
    below = pending.select { |f| f < @floor }

    case @direction
    when :up
      above.empty? ? (below.empty? ? :idle : :down) : :up
    when :down
      below.empty? ? (above.empty? ? :idle : :up) : :down
    else
      if above.empty? && below.empty?
        :idle
      elsif below.empty?
        :up
      elsif above.empty?
        :down
      else
        nearest_up = above.min - @floor
        nearest_down = @floor - below.max
        nearest_up <= nearest_down ? :up : :down
      end
    end
  end

  def busy?
    !(@waiting.empty? && @onboard.empty?)
  end
end

FLOORS = 8
SCHEDULE = [
  Request.new(1, 1, 3, 7),
  Request.new(2, 1, 6, 2),
  Request.new(3, 3, 1, 5),
  Request.new(4, 5, 8, 1),
  Request.new(5, 6, 4, 6),
  Request.new(6, 10, 2, 8),
  Request.new(7, 12, 7, 3)
].freeze

car = Elevator.new(FLOORS)
tick = 0
MAX_TICKS = 80

puts "#{SCHEDULE.length} requests over #{FLOORS} floors"
SCHEDULE.each { |r| puts "  #{r}" }
puts

while tick < MAX_TICKS
  tick += 1
  SCHEDULE.select { |r| r.at_tick == tick }.each { |r| car.submit(r) }
  break if !car.busy? && tick > SCHEDULE.map(&:at_tick).max
  car.step
end

puts "=== trace ==="
puts "tick floor dir    event"
car.log.each do |t, floor, dir, note|
  puts format("%4d %5d %-6s %s", t, floor, dir, note)
end
puts

puts "=== completions ==="
puts "req  requested served wait travel total"
rows = car.completed.sort_by { |r, _| r.id }
rows.each do |r, done_at|
  boarded = car.log.find { |_, _, _, note| note.include?("board #{r.id}") }
  board_tick = boarded.nil? ? r.at_tick : boarded[0]
  wait = board_tick - r.at_tick
  travel = done_at - board_tick
  puts format("R%-3d %9d %6d %4d %6d %5d", r.id, r.at_tick, done_at, wait, travel, done_at - r.at_tick)
end
puts

served = rows.length
puts "served #{served} of #{SCHEDULE.length}"
if served.positive?
  totals = rows.map { |r, done_at| done_at - r.at_tick }
  puts format("total time: min %d, max %d, mean %.2f", totals.min, totals.max,
              totals.reduce(0) { |s, v| s + v }.to_f / totals.length)
end
puts

puts "=== floor visit counts ==="
visits = {}
car.log.each { |_, floor, _, _| visits[floor] = (visits[floor] || 0) + 1 }
(1..FLOORS).each do |f|
  n = visits[f] || 0
  puts format("  floor %d %-2d %s", f, n, "#" * n)
end
puts

puts "=== direction changes ==="
dirs = car.log.map { |_, _, dir, _| dir }.reject { |d| d == :idle }
changes = dirs.each_cons(2).count { |a, b| a != b }
puts "  #{changes} reversals across #{dirs.length} moving ticks"
puts "  distance travelled #{car.log.each_cons(2).reduce(0) { |s, (a, b)| s + (b[1] - a[1]).abs }} floors"
puts "  idle ticks #{car.log.count { |_, _, dir, _| dir == :idle }}"
