# frozen_string_literal: true
class Obj195
  def initialize; @x = 7; end
  def to_s; "Obj-to-s"; end
  def inspect; "#<Obj-inspect>"; end
  private def sec195; 42; end
end

# Kernel#send
p("hello".send(:upcase))
v101 = "hello".send(:upcase); p v101
p(5.send(:+, 3))
v102 = 5.send(:+, 3); p v102
p([1, 2, 3].send(:map) { |n| n * 2 })
a101 = [3, 1, 2]; b101 = :sort; v103 = a101.send(b101); p v103
o101 = Obj195.new; p o101.send(:to_s)
# Nested send-family dispatch (send invoking send/__send__) aborts compilation:
p(o101.send(:send, :to_s))
p(o101.send(:__send__, :to_s))
o102 = Obj195.new; p o102.send(:sec195)

class Calc195
  def add(a, b); a + b; end
  def label(n); "n=#{n}"; end
  private def hidden; "secret"; end
end
# send a user method with arguments
p(Calc195.new.send(:add, 2, 3))
v104 = Calc195.new.send(:add, 2, 3); p v104
p(Calc195.new.send(:label, 7))
o104 = Calc195.new; v105 = o104.send(:label, 8); p v105
# string method name
p(Calc195.new.send("add", 10, 20))
# name held in a variable (drawn from the program's literal set)
o105 = Calc195.new; nm105 = :add; v106 = o105.send(nm105, 1, 1); p v106
# send reaches a private method
p(Calc195.new.send(:hidden))
o106 = Calc195.new; v107 = o106.send(:hidden); p v107

class Vk210; def run(data); data; end; end
p Vk210.new.run(age: 5)
vk210 = Vk210.new.run(age: 5); p vk210[:age]
