# Left-leaning red-black tree: an ordered symbol table with rank/select,
# floor/ceiling, range queries and full deletion (delete_min / delete_max /
# delete by key), plus a self-check of every red-black invariant.
#
# Stresses a recursive user type whose fields are the type itself, rotation-heavy
# pointer rewiring, boolean colour flips through `!`, and subtree sizes that only
# stay correct if every rebalance path recomputes them.

RED = true
BLACK = false

class RBNode
  attr_accessor :key, :val, :left, :right, :color, :size

  def initialize(key, val)
    @key = key
    @val = val
    @left = nil
    @right = nil
    @color = RED
    @size = 1
  end
end

class RBTree
  def initialize
    @root = nil
  end

  def size
    node_size(@root)
  end

  def empty?
    @root.nil?
  end

  def node_size(h)
    h.nil? ? 0 : h.size
  end

  def red?(h)
    return false if h.nil?
    h.color == RED
  end

  # --- rotations and colour flips ---------------------------------------

  def rotate_left(h)
    x = h.right
    h.right = x.left
    x.left = h
    x.color = h.color
    h.color = RED
    x.size = h.size
    h.size = 1 + node_size(h.left) + node_size(h.right)
    x
  end

  def rotate_right(h)
    x = h.left
    h.left = x.right
    x.right = h
    x.color = h.color
    h.color = RED
    x.size = h.size
    h.size = 1 + node_size(h.left) + node_size(h.right)
    x
  end

  def flip_colors(h)
    h.color = !h.color
    h.left.color = !h.left.color
    h.right.color = !h.right.color
  end

  def balance(h)
    h = rotate_left(h) if red?(h.right)
    h = rotate_right(h) if red?(h.left) && red?(h.left.left)
    flip_colors(h) if red?(h.left) && red?(h.right)
    h.size = 1 + node_size(h.left) + node_size(h.right)
    h
  end

  # --- search -----------------------------------------------------------

  def get(key)
    h = @root
    while h
      if key < h.key
        h = h.left
      elsif key > h.key
        h = h.right
      else
        return h.val
      end
    end
    nil
  end

  def include?(key)
    !get(key).nil?
  end

  # --- insertion --------------------------------------------------------

  def put(key, val)
    @root = insert(@root, key, val)
    @root.color = BLACK
    self
  end

  def insert(h, key, val)
    return RBNode.new(key, val) if h.nil?
    if key < h.key
      h.left = insert(h.left, key, val)
    elsif key > h.key
      h.right = insert(h.right, key, val)
    else
      h.val = val
    end
    balance(h)
  end

  # --- deletion ---------------------------------------------------------

  def move_red_left(h)
    flip_colors(h)
    if red?(h.right.left)
      h.right = rotate_right(h.right)
      h = rotate_left(h)
      flip_colors(h)
    end
    h
  end

  def move_red_right(h)
    flip_colors(h)
    if red?(h.left.left)
      h = rotate_right(h)
      flip_colors(h)
    end
    h
  end

  def min_node(h)
    h = h.left while h.left
    h
  end

  def max_node(h)
    h = h.right while h.right
    h
  end

  def min_key
    @root.nil? ? nil : min_node(@root).key
  end

  def max_key
    @root.nil? ? nil : max_node(@root).key
  end

  def delete_min
    return self if @root.nil?
    @root.color = RED if !red?(@root.left) && !red?(@root.right)
    @root = del_min(@root)
    @root.color = BLACK unless @root.nil?
    self
  end

  def del_min(h)
    return nil if h.left.nil?
    h = move_red_left(h) if !red?(h.left) && !red?(h.left.left)
    h.left = del_min(h.left)
    balance(h)
  end

  def delete_max
    return self if @root.nil?
    @root.color = RED if !red?(@root.left) && !red?(@root.right)
    @root = del_max(@root)
    @root.color = BLACK unless @root.nil?
    self
  end

  def del_max(h)
    h = rotate_right(h) if red?(h.left)
    return nil if h.right.nil?
    h = move_red_right(h) if !red?(h.right) && !red?(h.right.left)
    h.right = del_max(h.right)
    balance(h)
  end

  def delete(key)
    return self unless include?(key)
    @root.color = RED if !red?(@root.left) && !red?(@root.right)
    @root = del(@root, key)
    @root.color = BLACK unless @root.nil?
    self
  end

  def del(h, key)
    if key < h.key
      h = move_red_left(h) if !red?(h.left) && !red?(h.left.left)
      h.left = del(h.left, key)
    else
      h = rotate_right(h) if red?(h.left)
      return nil if key == h.key && h.right.nil?
      h = move_red_right(h) if !red?(h.right) && !red?(h.right.left)
      if key == h.key
        x = min_node(h.right)
        h.key = x.key
        h.val = x.val
        h.right = del_min(h.right)
      else
        h.right = del(h.right, key)
      end
    end
    balance(h)
  end

  # --- order statistics -------------------------------------------------

  def rank(key)
    node_rank(@root, key)
  end

  def node_rank(h, key)
    return 0 if h.nil?
    if key < h.key
      node_rank(h.left, key)
    elsif key > h.key
      1 + node_size(h.left) + node_rank(h.right, key)
    else
      node_size(h.left)
    end
  end

  def select_rank(k)
    h = @root
    while h
      t = node_size(h.left)
      if k < t
        h = h.left
      elsif k > t
        k -= t + 1
        h = h.right
      else
        return h.key
      end
    end
    nil
  end

  def floor_key(key)
    h = node_floor(@root, key)
    h.nil? ? nil : h.key
  end

  def node_floor(h, key)
    return nil if h.nil?
    return h if key == h.key
    return node_floor(h.left, key) if key < h.key
    t = node_floor(h.right, key)
    t.nil? ? h : t
  end

  def ceiling_key(key)
    h = node_ceiling(@root, key)
    h.nil? ? nil : h.key
  end

  def node_ceiling(h, key)
    return nil if h.nil?
    return h if key == h.key
    return node_ceiling(h.right, key) if key > h.key
    t = node_ceiling(h.left, key)
    t.nil? ? h : t
  end

  def keys
    acc = []
    collect(@root, acc)
    acc
  end

  def keys_in(lo, hi)
    acc = []
    range_collect(@root, lo, hi, acc)
    acc
  end

  def range_collect(h, lo, hi, acc)
    return if h.nil?
    range_collect(h.left, lo, hi, acc) if lo < h.key
    acc << h.key if lo <= h.key && h.key <= hi
    range_collect(h.right, lo, hi, acc) if hi > h.key
  end

  def collect(h, acc)
    return if h.nil?
    collect(h.left, acc)
    acc << h.key
    collect(h.right, acc)
  end

  # --- invariants -------------------------------------------------------

  def height
    node_height(@root)
  end

  def node_height(h)
    return -1 if h.nil?
    lh = node_height(h.left)
    rh = node_height(h.right)
    1 + (lh > rh ? lh : rh)
  end

  def black_height
    n = 0
    h = @root
    while h
      n += 1 unless red?(h)
      h = h.left
    end
    n
  end

  def bst?
    ks = keys
    i = 1
    while i < ks.length
      return false if ks[i - 1] >= ks[i]
      i += 1
    end
    true
  end

  def sizes_consistent?(h = @root)
    return true if h.nil?
    return false if h.size != 1 + node_size(h.left) + node_size(h.right)
    sizes_consistent?(h.left) && sizes_consistent?(h.right)
  end

  def two_three?(h = @root)
    return true if h.nil?
    return false if red?(h.right)
    return false if h != @root && red?(h) && red?(h.left)
    two_three?(h.left) && two_three?(h.right)
  end

  def balanced?
    check_balance(@root, black_height)
  end

  def check_balance(h, n)
    return n == 0 if h.nil?
    n -= 1 unless red?(h)
    check_balance(h.left, n) && check_balance(h.right, n)
  end

  def valid?
    bst? && sizes_consistent? && two_three? && balanced?
  end
end

# --- driver -------------------------------------------------------------

WORDS = %w[
  quartz maple ember lattice onyx birch cinder vellum harbor tundra
  saffron pewter cobalt juniper aster nimbus flint garnet willow zephyr
]

tree = RBTree.new
WORDS.each_with_index { |w, i| tree.put(w, i * i) }

puts "-- built --"
puts "size=#{tree.size} height=#{tree.height} black_height=#{tree.black_height}"
puts "valid=#{tree.valid?}"
puts "min=#{tree.min_key} max=#{tree.max_key}"

puts
puts "-- lookups --"
%w[cobalt quartz zephyr absent maple].each do |k|
  puts format("get(%-7s) = %s", k, tree.get(k).inspect)
end

puts
puts "-- order statistics --"
puts "keys: #{tree.keys.join(' ')}"
0.step(tree.size - 1, 4) { |k| puts "select(#{k}) = #{tree.select_rank(k)} rank=#{tree.rank(tree.select_rank(k))}" }
%w[cobalt cz aa zz].each do |probe|
  puts format("floor(%-6s)=%-8s ceiling(%-6s)=%s",
              probe, tree.floor_key(probe).inspect, probe, tree.ceiling_key(probe).inspect)
end
puts "range(cinder..maple) = #{tree.keys_in('cinder', 'maple').join(' ')}"

puts
puts "-- delete_min x5 / delete_max x3 --"
5.times { tree.delete_min }
3.times { tree.delete_max }
puts "size=#{tree.size} valid=#{tree.valid?} min=#{tree.min_key} max=#{tree.max_key}"
puts "keys: #{tree.keys.join(' ')}"

puts
puts "-- delete by key --"
%w[nimbus juniper quartz onyx pewter].each do |k|
  tree.delete(k)
  puts format("after delete(%-8s) size=%2d valid=%s bh=%d", k, tree.size, tree.valid?, tree.black_height)
end
puts "keys: #{tree.keys.join(' ')}"

puts
puts "-- drain --"
until tree.empty?
  k = tree.min_key
  tree.delete(k)
  raise "invariant broken after removing #{k}" unless tree.valid?
end
puts "size=#{tree.size} empty=#{tree.empty?} keys=#{tree.keys.inspect}"
puts "min=#{tree.min_key.inspect} get=#{tree.get('maple').inspect} rank=#{tree.rank('maple')}"

puts
puts "-- reinsert ascending (worst case for a plain BST) --"
t2 = RBTree.new
(1..31).each { |i| t2.put(format("k%02d", i), i) }
puts "size=#{t2.size} height=#{t2.height} bh=#{t2.black_height} valid=#{t2.valid?}"
puts "select(15)=#{t2.select_rank(15)} floor(k07x)=#{t2.floor_key('k07x')} ceiling(k07x)=#{t2.ceiling_key('k07x')}"
t2.put('k07', 700)
puts "overwrite k07 -> #{t2.get('k07')} size=#{t2.size} valid=#{t2.valid?}"
