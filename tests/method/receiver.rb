# frozen_string_literal: true
# Method#receiver
class Calc
  def initialize(base); @base = base; end
  def add(n); @base + n; end
end

# receiver of a bound method is the object it was extracted from
calc001 = Calc.new(5); p(calc001.method(:add).receiver == calc001)
calc002 = Calc.new(5); bm002 = calc002.method(:add); v002 = (bm002.receiver == calc002); p v002

# the receiver can be re-invoked to reproduce the bound call
calc003 = Calc.new(7); p(calc003.method(:add).receiver.add(3))
calc004 = Calc.new(7); bm004 = calc004.method(:add); v004 = bm004.receiver.add(3); p v004

def dbp(n) = n
p(method(:dbp).receiver.equal?(self))

# receiver of a bound method on a builtin, and one held in a container
p(5.method(:+).receiver)
v010 = 5.method(:+).receiver; p v010
m011 = "ab".method(:upcase); p(m011.receiver)
v011 = m011.receiver; p v011
# a Method read out of a container loses #receiver
ms012 = [Calc.new(3).method(:add)]
r012 = (ms012[0].receiver.class rescue $!.class); p r012
v012 = (ms012[0].receiver.is_a?(Calc) rescue $!.class); p v012
# #receiver taken from an inline-constructed object is refused at compile time
p(Calc.new(3).method(:add).receiver.class)
m013 = Calc.new(3).method(:add); p(m013.receiver.add(1))
# the receiver survives being re-read from a local
c013 = Calc.new(9); bm013 = c013.method(:add)
p(bm013.receiver == c013)
v013 = (bm013.receiver == c013); p v013
p(bm013.receiver.add(1))
