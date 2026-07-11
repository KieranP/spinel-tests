# frozen_string_literal: true
# Hash.new
p(Hash.new(0)[:missing])
a316 = Hash.new(0); p(a316[:missing])
a317 = Hash.new { |_h, k| k.to_s }; p(a317[:missing])
a318 = Hash.new; c318 = (a318[:missing]); p c318
a319 = Hash.new(0); a319[:x] += 5; p(a319)
p(Hash.new)
n320 = Hash.new; p(n320)
p(Hash.new("def")["missing"])
n321 = Hash.new("def"); p(n321["missing"])
n322 = Hash.new(0); n322[:a] = 1; n322[:a] += 10; p(n322[:a])
n323 = Hash.new(0); n323[:a] += 1; n323[:b] += 2; n323[:a] += 1; p(n323)
p(Hash.new { |h, k| h[k] = k.to_s }[:x])
n324 = Hash.new { |h, k| h[k] = k.to_s }; c324 = (n324[:x]); p c324
n325 = Hash.new { |_h, k| k * 2 }; p(n325[3])
n326 = Hash.new { |_h, k| "v#{k}" }; c326 = (n326[:z]); p c326
n327 = Hash.new(99); p(n327)

# Under a rescue modifier the empty constructor loses its value
n328 = (Hash.new rescue 0); p n328
n329 = begin
  Hash.new
rescue
#   0
end
p n329

# Hash.new as an optional parameter's default value (kept commented: it aborts the C build)
def f330(n330, memo330 = Hash.new); memo330[n330] = n330; memo330; end
p f330(1)

class Counter601
  def initialize
    @counts = Hash.new(0)
  end

  def bump(key)
    @counts[key] += 1
    @counts
  end
end
p Counter601.new.bump(:a)
w604 = Counter601.new.bump(:b); p w604
