# frozen_string_literal: true
# Least-recently-used cache over a Hash plus an ordering Array.
# Inference: a Hash{String=>Integer} store and an Array(String) recency list are
# mutated together; eviction deletes from both while keeping element types stable.

class LRU
  def initialize(capacity)
    @capacity = capacity
    @store = {}
    @order = []
  end

  def get(key)
    return nil unless @store.key?(key)
    touch(key)
    @store[key]
  end

  def put(key, value)
    @store[key] = value
    touch(key)
    if @store.size > @capacity
      oldest = @order.shift
      @store.delete(oldest)
    end
    self
  end

  def touch(key)
    @order.delete(key)
    @order << key
  end

  def keys_in_order = @order.dup
end

cache = LRU.new(3)
cache.put("a", 1).put("b", 2).put("c", 3)
cache.get("a")
cache.put("d", 4) # evicts "b"

p cache.get("a")
p cache.get("b")
p cache.get("c")
p cache.get("d")
p cache.keys_in_order
