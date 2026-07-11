# frozen_string_literal: true
# A turtle-graphics interpreter: a tiny command language drives a pen over an
# ASCII canvas, and the program reports the drawn bounds, ink used and path log.
# Inference: a command String is split and dispatched through a case/when to
# methods that mutate Array(String) rows in place while tracking Float heading.

PROGRAM = <<~TURTLE
  pen down
  forward 10
  right 90
  forward 4
  right 90
  forward 10
  right 90
  forward 4
  pen up
  forward 3
  right 45
  pen down
  forward 5
TURTLE

class Canvas
  def initialize(width, height)
    @width = width
    @height = height
    @rows = Array.new(height) { Array.new(width, " ") }
    @ink = 0
  end

  attr_reader :ink

  def plot(x, y, mark)
    return false if x.negative? || y.negative? || x >= @width || y >= @height
    @ink += 1 if @rows[y][x] == " "
    @rows[y][x] = mark
    true
  end

  def bounds
    filled = []
    @rows.each_with_index do |row, y|
      row.each_with_index { |cell, x| filled << [x, y] if cell != " " }
    end
    return nil if filled.empty?
    xs = filled.map { |xy| xy[0] }
    ys = filled.map { |xy| xy[1] }
    [xs.min, ys.min, xs.max, ys.max]
  end

  def render
    x0, y0, x1, y1 = bounds
    return [] unless x0
    (y0..y1).map { |y| @rows[y][x0..x1].join.rstrip }
  end
end

class Turtle
  MARKS = { 0 => "-", 90 => "|", 180 => "-", 270 => "|" }.freeze

  def initialize(canvas, x, y)
    @canvas = canvas
    @x = x
    @y = y
    @heading = 0
    @down = false
    @log = []
  end

  attr_reader :log

  def run(source)
    source.each_line do |line|
      words = line.strip.split(" ")
      next if words.empty?
      case words[0]
      when "pen"     then pen(words[1])
      when "forward" then forward(words[1].to_i)
      when "right"   then turn(words[1].to_i)
      when "left"    then turn(-words[1].to_i)
      else @log << "skip #{words[0]}"
      end
    end
    self
  end

  def pen(state)
    @down = (state == "down")
    @log << "pen=#{@down}"
  end

  def turn(degrees)
    @heading = (@heading + degrees) % 360
    @log << "head=#{@heading}"
  end

  def forward(steps)
    rad = @heading * Math::PI / 180.0
    dx = Math.cos(rad)
    dy = Math.sin(rad)
    mark = MARKS[@heading] || "+"
    steps.times do
      @x += dx
      @y += dy
      @canvas.plot(@x.round, @y.round, mark) if @down
    end
    @log << format("fwd %d -> (%.1f,%.1f)", steps, @x, @y)
  end

  def position = [@x.round, @y.round]
end

canvas = Canvas.new(30, 20)
turtle = Turtle.new(canvas, 4, 10)
turtle.run(PROGRAM)

canvas.render.each { |row| puts row }
puts "=" * 12

p canvas.ink
p canvas.bounds
p turtle.position
p turtle.log.length
p turtle.log.first
p turtle.log.last
p turtle.log.count { |entry| entry.start_with?("fwd") }
p turtle.log.select { |entry| entry.start_with?("head=") }
p turtle.log.grep(/pen=/)

marks = turtle.log.group_by { |entry| entry.split("=").first.split(" ").first }
p marks.keys.sort
p marks.map { |k, v| [k, v.length] }.sort.to_h
