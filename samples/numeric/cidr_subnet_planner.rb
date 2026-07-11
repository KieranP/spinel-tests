# frozen_string_literal: true
# An IPv4 subnet planner: parse CIDR blocks into 32-bit integers, split a supernet
# into variable-length subnets sized to each department's host demand, check for
# overlaps, and summarise contiguous allocations back into the largest legal blocks.
# Inference: addresses stay Integer through shifts, masks and comparisons while their
# printed form is String, a Comparable value class orders blocks, and the allocator
# folds a sorted requirement list into an Array of that user type.

class Cidr
  include Comparable

  attr_reader :address, :prefix

  def initialize(address, prefix)
    raise ArgumentError, "prefix out of range: #{prefix}" unless prefix.between?(0, 32)

    @prefix = prefix
    @address = address & mask
  end

  def self.parse(text)
    ip, len = text.split("/")
    new(to_int(ip), len.nil? ? 32 : Integer(len))
  end

  def self.to_int(ip)
    octets = ip.split(".").map { |o| Integer(o) }
    raise ArgumentError, "bad address: #{ip}" unless octets.size == 4 && octets.all? { |o| o.between?(0, 255) }

    octets.reduce(0) { |acc, o| (acc << 8) | o }
  end

  def self.to_s_ip(int) = [24, 16, 8, 0].map { |shift| (int >> shift) & 0xFF }.join(".")

  def mask = @prefix.zero? ? 0 : ((1 << 32) - 1) ^ ((1 << (32 - @prefix)) - 1)
  def size = 1 << (32 - @prefix)
  def first = @address
  def last = @address + size - 1
  def usable = @prefix >= 31 ? size : size - 2
  def broadcast = last
  def netmask = self.class.to_s_ip(mask)
  def to_s = "#{self.class.to_s_ip(@address)}/#{@prefix}"
  def to_range = (first..last)

  def include?(other)
    other.is_a?(Cidr) ? first <= other.first && other.last <= last : to_range.cover?(other)
  end

  def overlap?(other) = first <= other.last && other.first <= last

  def split
    raise ArgumentError, "cannot split a /32" if @prefix == 32

    child = @prefix + 1
    [Cidr.new(first, child), Cidr.new(first + (1 << (32 - child)), child)]
  end

  def sibling
    return nil if @prefix.zero?

    Cidr.new(first ^ (1 << (32 - @prefix)), @prefix)
  end

  def <=>(other) = [first, prefix] <=> [other.first, other.prefix]
  def ==(other) = other.is_a?(Cidr) && first == other.first && prefix == other.prefix
  alias eql? ==
  def hash = [first, prefix].hash
end

def prefix_for(hosts)
  needed = hosts + 2
  prefix = 32
  prefix -= 1 while (1 << (32 - prefix)) < needed && prefix.positive?
  prefix
end

def allocate(supernet, demands)
  free = [supernet]
  assigned = {}
  demands.sort_by { |name, hosts| [-hosts, name] }.each do |name, hosts|
    want = prefix_for(hosts)
    block = free.select { |b| b.prefix <= want }.min_by { |b| [-b.prefix, b.first] }
    if block.nil?
      assigned[name] = nil
      next
    end

    free.delete(block)
    while block.prefix < want
      low, high = block.split
      free << high
      block = low
    end
    free.sort!
    assigned[name] = block
  end
  [assigned, free.sort]
end

SUPERNET = Cidr.parse("10.20.0.0/20")

puts "== the supernet =="
puts "block: #{SUPERNET}  netmask: #{SUPERNET.netmask}"
puts "range: #{Cidr.to_s_ip(SUPERNET.first)} - #{Cidr.to_s_ip(SUPERNET.last)}"
puts "addresses: #{SUPERNET.size}, usable: #{SUPERNET.usable}"

puts
puts "== host demand to prefix length =="
[1, 2, 5, 30, 62, 100, 500, 1000].each do |hosts|
  prefix = prefix_for(hosts)
  puts format("  %4d hosts -> /%-2d  (%d addresses, %d usable)",
              hosts, prefix, 1 << (32 - prefix), (1 << (32 - prefix)) - 2)
end

DEMANDS = {
  "engineering" => 900,
  "sales" => 200,
  "support" => 100,
  "lab" => 60,
  "voip" => 25,
  "dmz" => 6,
  "mgmt" => 2
}.freeze

assigned, leftover = allocate(SUPERNET, DEMANDS)

puts
puts "== allocation =="
assigned.sort_by { |_name, block| block.nil? ? [1 << 32, 0] : [block.first, block.prefix] }.each do |name, block|
  if block.nil?
    puts format("  %-12s UNSATISFIED", name)
  else
    puts format("  %-12s %-18s hosts %4d  usable %4d  (needed %d)",
                name, block.to_s, DEMANDS.fetch(name), block.usable, DEMANDS.fetch(name))
  end
end

placed = assigned.values.compact
puts "allocated blocks: #{placed.size} of #{DEMANDS.size}"
puts "every block fits its demand: #{placed.all? { |b| b.usable >= DEMANDS.fetch(assigned.key(b)) }}"

puts
puts "== invariants =="
puts "all inside the supernet: #{placed.all? { |b| SUPERNET.include?(b) }}"
pairs = placed.combination(2).to_a
puts "pairwise overlaps: #{pairs.count { |a, b| a.overlap?(b) }} of #{pairs.size} pairs"
covered = placed.sum(&:size) + leftover.sum(&:size)
puts "allocated + free covers the supernet exactly: #{covered == SUPERNET.size} (#{covered}/#{SUPERNET.size})"

puts
puts "== free space, largest first =="
leftover.sort_by { |b| [b.prefix, b.first] }.first(6).each do |block|
  puts format("  %-18s %6d addresses", block.to_s, block.size)
end
puts "free blocks: #{leftover.size}, free addresses: #{leftover.sum(&:size)}"

puts
puts "== membership and containment =="
probe = Cidr.parse("10.20.3.77/32")
owner = placed.find { |b| b.include?(probe) }
puts "#{probe} belongs to #{owner.nil? ? "no allocation" : owner.to_s}"
outside = Cidr.parse("10.21.0.1/32")
puts "#{outside} inside the supernet: #{SUPERNET.include?(outside)}"
puts "supernet contains 10.20.15.255: #{SUPERNET.include?(Cidr.to_int("10.20.15.255"))}"
puts "supernet contains 10.20.16.0:   #{SUPERNET.include?(Cidr.to_int("10.20.16.0"))}"

puts
puts "== splitting and siblings =="
a, b = SUPERNET.split
puts "#{SUPERNET} splits into #{a} and #{b}"
puts "they are siblings: #{a.sibling == b && b.sibling == a}"
puts "they tile the parent: #{a.size + b.size == SUPERNET.size}"
quarters = [a, b].flat_map(&:split)
puts "quarters: #{quarters.map(&:to_s).inspect}"
puts "quarters are sorted and contiguous: #{quarters.each_cons(2).all? { |x, y| x.last + 1 == y.first }}"

puts
puts "== ordering and equality =="
sorted = placed.sort
puts "ascending: #{sorted.map(&:to_s).inspect}"
puts "min #{sorted.min}, max #{sorted.max}"
puts "sort is stable against re-parse: #{sorted.map(&:to_s).map { |s| Cidr.parse(s) } == sorted}"
dupes = [Cidr.parse("10.20.0.0/24"), Cidr.parse("10.20.0.0/24"), Cidr.parse("10.20.1.0/24")]
puts "uniq collapses equal blocks: #{dupes.uniq.map(&:to_s).inspect}"

puts
puts "== parse errors =="
["10.20.0.0/33", "300.1.1.1/24", "10.20.0/24"].each do |text|
  result = (Cidr.parse(text).to_s rescue $!.class)
  puts "  #{text} -> #{result}"
end
