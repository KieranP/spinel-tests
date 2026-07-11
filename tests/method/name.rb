# frozen_string_literal: true
# Method#name
def double(n) = n * 2

class Calc
  def add(n); n + 1; end
end

p(method(:double).name)
m001 = method(:double); v001 = m001.name; p v001

# bound method name
calc002 = Calc.new; p calc002.method(:add).name
calc003 = Calc.new; bm003 = calc003.method(:add); v003 = bm003.name; p v003
