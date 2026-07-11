# frozen_string_literal: true
# Exception#frozen? (Object#frozen? / Object#freeze on an exception instance)
# a fresh exception is not frozen
p(RuntimeError.new("m").frozen?)
f001 = RuntimeError.new("m").frozen?; p f001
p(ArgumentError.new.frozen?)

# a rescued exception is not frozen either
begin; raise TypeError, "t"; rescue => e002; p e002.frozen?; end
f002 = (begin; raise TypeError, "t"; rescue => x002; x002.frozen?; end); p f002

# freeze returns the receiver
p(RuntimeError.new("m").freeze.class)
f003 = RuntimeError.new("m"); p(f003.freeze.equal?(f003))

# after freeze, frozen? is true
p(RuntimeError.new("f").freeze.frozen?)
f004 = RuntimeError.new("f").freeze; p f004.frozen?

# a frozen exception is still readable
f005 = ArgumentError.new("readable").freeze
p f005.message
p f005.class
