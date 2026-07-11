# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
end

# Object#to_s
p(5.to_s)
v055 = 5.to_s; p v055
p("x".to_s)
v056 = "x".to_s; p v056
p([1, 2].to_s)
v057 = [1, 2].to_s; p v057
p(Obj195.new.to_s)
a081 = Obj195.new; v058 = a081.to_s; p v058
puts Obj195.new
a082 = Obj195.new; puts a082

class Bare195
  def initialize; @x = 1; end
end
# default to_s: "#<Bare195:0x...>" -- check the prefix, not the address
o083 = Bare195.new
p o083.to_s.start_with?("#<Bare195")
v083 = o083.to_s.start_with?("#<Bare195"); p v083
p o083.to_s.include?("0x")
# default to_s does NOT include ivars (unlike inspect)
p o083.to_s.include?("@x")
v084 = o083.to_s.include?("@x"); p v084
