# frozen_string_literal: true
# A price-time-priority limit order book: limit and market orders match against
# resting liquidity, partial fills leave remainders, cancels remove resting size,
# and the run ends with a trade tape, depth ladder and per-account P&L.
# Inference: Struct orders flow through Hash{Integer=>Array(Order)} price levels,
# a fill is a third user type built from two others, and the same reduce folds
# Integer sizes and Rational cash across polymorphic side handling.

Order = Struct.new(:id, :account, :side, :price, :size, :kind) do
  def buy? = side == :buy
  def market? = kind == :market
  def to_s = "##{id} #{account} #{side} #{size}@#{price.nil? ? "MKT" : price}"
end

Fill = Struct.new(:taker_id, :maker_id, :price, :size) do
  def notional = price * size
  def to_s = "#{size} @ #{price} (taker ##{taker_id} / maker ##{maker_id})"
end

class OrderBook
  attr_reader :tape, :rejected

  def initialize
    @bids = Hash.new { |h, k| h[k] = [] }
    @asks = Hash.new { |h, k| h[k] = [] }
    @tape = []
    @rejected = []
    @resting = {}
  end

  def submit(order)
    fills = order.buy? ? match(order, @asks, :ascending) : match(order, @bids, :descending)
    @tape.concat(fills)
    if order.size.positive?
      if order.market?
        @rejected << order
      else
        book = order.buy? ? @bids : @asks
        book[order.price] << order
        @resting[order.id] = order
      end
    end
    fills
  end

  def cancel(id)
    order = @resting.delete(id)
    return false if order.nil?

    book = order.buy? ? @bids : @asks
    level = book[order.price]
    level.delete(order)
    book.delete(order.price) if level.empty?
    true
  end

  def best_bid = @bids.keys.max
  def best_ask = @asks.keys.min

  def spread
    return nil if best_bid.nil? || best_ask.nil?

    best_ask - best_bid
  end

  def depth(side)
    book = side == :buy ? @bids : @asks
    pairs = book.map { |price, orders| [price, orders.sum(&:size)] }.reject { |_p, s| s.zero? }
    side == :buy ? pairs.sort.reverse : pairs.sort
  end

  private

  def match(taker, book, direction)
    fills = []
    loop do
      break if taker.size.zero?

      prices = book.keys.reject { |p| book[p].empty? }
      break if prices.empty?

      level_price = direction == :ascending ? prices.min : prices.max
      break unless crossable?(taker, level_price, direction)

      level = book[level_price]
      maker = level.first
      traded = [taker.size, maker.size].min
      taker.size -= traded
      maker.size -= traded
      fills << Fill.new(taker.id, maker.id, level_price, traded)
      if maker.size.zero?
        level.shift
        @resting.delete(maker.id)
      end
      book.delete(level_price) if level.empty?
    end
    fills
  end

  def crossable?(taker, level_price, direction)
    return true if taker.market?

    direction == :ascending ? taker.price >= level_price : taker.price <= level_price
  end
end

book = OrderBook.new
next_id = 0
mint = lambda do |account, side, price, size, kind = :limit|
  next_id += 1
  Order.new(next_id, account, side, price, size, kind)
end

puts "== building the book =="
resting = [
  mint.call("alice", :sell, 102, 50),
  mint.call("alice", :sell, 101, 30),
  mint.call("bob",   :sell, 101, 20),
  mint.call("carol", :sell, 103, 40),
  mint.call("dave",  :buy,   99, 60),
  mint.call("erin",  :buy,   98, 25),
  mint.call("dave",  :buy,   99, 15)
]
resting.each { |o| book.submit(o) }
puts "best bid/ask: #{book.best_bid}/#{book.best_ask}  spread: #{book.spread}"
puts "bid depth: #{book.depth(:buy).inspect}"
puts "ask depth: #{book.depth(:sell).inspect}"

puts
puts "== an aggressive limit buy sweeps two price levels =="
sweeper = mint.call("frank", :buy, 102, 75)
fills = book.submit(sweeper)
fills.each { |f| puts "  #{f}" }
puts "remainder rests: #{sweeper.size}@#{sweeper.price}"
puts "best bid/ask now: #{book.best_bid}/#{book.best_ask}"

puts
puts "== a market sell walks the bid side =="
mkt = mint.call("gina", :sell, nil, 90, :market)
book.submit(mkt).each { |f| puts "  #{f}" }
puts "unfilled market size: #{mkt.size} (rejected: #{book.rejected.size})"

puts
puts "== cancels =="
puts "cancel resting sell ##{resting[3].id}: #{book.cancel(resting[3].id)}"
puts "cancel it again: #{book.cancel(resting[3].id)}"
puts "cancel an unknown id: #{book.cancel(9999)}"
puts "ask depth after cancel: #{book.depth(:sell).inspect}"

puts
puts "== trade tape =="
book.tape.each_with_index { |f, i| puts format("%2d  %s", i + 1, f) }
puts "trades: #{book.tape.size}  shares: #{book.tape.sum(&:size)}"
puts "notional: #{book.tape.sum(&:notional)}"
vwap = Rational(book.tape.sum(&:notional), book.tape.sum(&:size))
puts "vwap: #{vwap} (#{vwap.to_f.round(4)})"

puts
puts "== per-account position and cash =="
positions = Hash.new(0)
cash = Hash.new(0)
by_id = (resting + [sweeper, mkt]).to_h { |o| [o.id, o] }
book.tape.each do |fill|
  taker = by_id.fetch(fill.taker_id)
  maker = by_id.fetch(fill.maker_id)
  sign = taker.buy? ? 1 : -1
  positions[taker.account] += sign * fill.size
  positions[maker.account] -= sign * fill.size
  cash[taker.account] -= sign * fill.notional
  cash[maker.account] += sign * fill.notional
end
positions.keys.sort.each do |acct|
  puts format("%-6s pos %+4d  cash %+6d", acct, positions[acct], cash[acct])
end
puts "positions net to zero: #{positions.values.sum.zero?}"
puts "cash nets to zero: #{cash.values.sum.zero?}"
