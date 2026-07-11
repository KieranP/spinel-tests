# frozen_string_literal: true
# Resolve a package dependency graph: topological install order, cycle
# detection, transitive closure, and an "orphaned packages" report. Adjacency is
# held as a Hash of Sets.

require "set"

Package = Data.define(:name, :version, :deps) do
  def to_s
    "#{name}-#{version}"
  end

  def leaf?
    deps.empty?
  end
end

class Registry
  def initialize
    @packages = {}
    @edges = {}
  end

  def add(pkg)
    @packages[pkg.name] = pkg
    @edges[pkg.name] = Set.new(pkg.deps)
    self
  end

  def names
    @packages.keys.sort
  end

  def [](name)
    @packages[name]
  end

  def deps_of(name)
    @edges[name] || Set.new
  end

  def missing
    declared = Set.new
    @edges.each_value { |s| declared.merge(s) }
    (declared - Set.new(@packages.keys)).to_a.sort
  end

  def dependents_of(name)
    @edges.select { |_, deps| deps.include?(name) }.keys.sort
  end

  # Reverse-postorder DFS: dependencies before dependents.
  def install_order
    state = {}
    order = []
    names.each { |n| visit(n, state, order, []) }
    order
  end

  def visit(name, state, order, path)
    case state[name]
    when :done then return
    when :active
      cycle = path.drop_while { |p| p != name } + [name]
      raise "dependency cycle: #{cycle.join(" -> ")}"
    end
    return unless @packages.key?(name)

    state[name] = :active
    deps_of(name).to_a.sort.each { |d| visit(d, state, order, path + [name]) }
    state[name] = :done
    order << name
  end

  def transitive(name)
    seen = Set.new
    stack = deps_of(name).to_a
    until stack.empty?
      d = stack.pop
      next if seen.include?(d)
      seen << d
      deps_of(d).each { |n| stack.push(n) unless seen.include?(n) }
    end
    seen
  end

  def roots
    referenced = Set.new
    @edges.each_value { |s| referenced.merge(s) }
    names.reject { |n| referenced.include?(n) }
  end

  def leaves
    names.select { |n| deps_of(n).empty? }
  end

  def depth(name, memo = {})
    return memo[name] if memo.key?(name)
    d = deps_of(name).to_a
    memo[name] = d.empty? ? 0 : 1 + d.map { |x| depth(x, memo) }.max
    memo[name]
  end
end

reg = Registry.new
reg.add(Package.new(name: "app", version: "1.0.0", deps: ["web", "db", "logger"]))
reg.add(Package.new(name: "web", version: "2.3.1", deps: ["http", "json", "logger"]))
reg.add(Package.new(name: "db", version: "0.9.4", deps: ["pool", "logger"]))
reg.add(Package.new(name: "http", version: "1.2.0", deps: ["socket"]))
reg.add(Package.new(name: "json", version: "3.0.0", deps: []))
reg.add(Package.new(name: "pool", version: "1.1.2", deps: ["socket"]))
reg.add(Package.new(name: "socket", version: "4.0.1", deps: []))
reg.add(Package.new(name: "logger", version: "1.5.0", deps: []))
reg.add(Package.new(name: "cli", version: "0.1.0", deps: ["logger"]))

puts "#{reg.names.length} packages registered"
reg.names.each do |n|
  pkg = reg[n]
  puts format("  %-8s %-8s deps: %s", pkg.name, pkg.version,
              pkg.deps.empty? ? "(none)" : pkg.deps.sort.join(" "))
end
puts

puts "missing (declared but not registered): #{reg.missing.inspect}"
puts "roots (nothing depends on them):      #{reg.roots.inspect}"
puts "leaves (depend on nothing):           #{reg.leaves.inspect}"
puts

puts "=== install order ==="
order = reg.install_order
order.each_with_index { |n, i| puts format("  %2d. %s", i + 1, reg[n]) }
puts

puts "order is valid? #{order.each_with_index.all? { |n, i| reg.deps_of(n).all? { |d| order[0, i].include?(d) } }}"
puts

puts "=== transitive closures ==="
reg.names.each do |n|
  t = reg.transitive(n).to_a.sort
  puts format("  %-8s %-2d %s", n, t.length, t.join(" "))
end
puts

puts "=== dependency depth ==="
reg.names.sort_by { |n| [-reg.depth(n), n] }.each do |n|
  d = reg.depth(n)
  puts format("  %-8s %d %s", n, d, "-" * d)
end
puts

puts "=== reverse dependencies ==="
reg.names.each do |n|
  dep = reg.dependents_of(n)
  puts format("  %-8s %s", n, dep.empty? ? "(nothing)" : dep.join(" "))
end
puts

puts "=== most depended-upon ==="
counts = reg.names.map { |n| [n, reg.dependents_of(n).length] }
counts.sort_by { |n, c| [-c, n] }.first(3).each do |n, c|
  puts format("  %-8s %d dependents %s", n, c, "*" * c)
end
puts

puts "=== Data value semantics ==="
a = Package.new(name: "json", version: "3.0.0", deps: [])
b = Package.new(name: "json", version: "3.0.0", deps: [])
puts "  equal by value?  #{a == b}"
puts "  same object?     #{a.equal?(b)}"
puts "  to_h             #{a.to_h.inspect}"
puts "  with(version:)   #{a.with(version: "3.1.0")}"
puts "  leaf?            #{a.leaf?}"
puts "  frozen?          #{a.frozen?}"
puts

puts "=== cycle detection ==="
bad = Registry.new
bad.add(Package.new(name: "x", version: "1", deps: ["y"]))
bad.add(Package.new(name: "y", version: "1", deps: ["z"]))
bad.add(Package.new(name: "z", version: "1", deps: ["x"]))
begin
  bad.install_order
  puts "  no cycle reported"
rescue RuntimeError => e
  puts "  #{e.message}"
end

self_dep = Registry.new
self_dep.add(Package.new(name: "solo", version: "1", deps: ["solo"]))
begin
  self_dep.install_order
  puts "  self-dependency accepted"
rescue RuntimeError => e
  puts "  #{e.message}"
end
