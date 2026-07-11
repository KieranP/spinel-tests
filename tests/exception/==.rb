# frozen_string_literal: true
# Exception#==
# equal: same class and same message
p(ArgumentError.new("bad") == ArgumentError.new("bad"))
a001 = ArgumentError.new("bad"); b001 = ArgumentError.new("bad"); p(a001 == b001)
c001 = (ArgumentError.new("bad") == ArgumentError.new("bad")); p c001

# different message -> not equal
p(ArgumentError.new("a") == ArgumentError.new("b"))
a002 = ArgumentError.new("a"); b002 = ArgumentError.new("b"); p(a002 == b002)

# different class, same message -> not equal
p(ArgumentError.new("x") == TypeError.new("x"))
a003 = ArgumentError.new("x"); b003 = TypeError.new("x"); p(a003 == b003)

# reflexive
a004 = RuntimeError.new("m"); p(a004 == a004)

# not equal to a non-exception
p(RuntimeError.new("m") == "m")
c005 = (RuntimeError.new("m") == "m"); p c005

# two instances of a user-defined subclass with the same message
class EqSub007 < StandardError; end
p(EqSub007.new("t") == EqSub007.new("t"))
a007 = EqSub007.new("t"); b007 = EqSub007.new("t"); c007 = (a007 == b007); p c007

# a user-subclass instance compared with a base-class instance (kept commented:
# the call is refused at compile time, which aborts the file)
p(EqSub007.new("t") == StandardError.new("t"))

# two separately-raised exceptions of the same class and message differ in Ruby
# because their backtraces differ
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# first006 = (begin; raise ArgumentError, "x"; rescue => x006; x006; end)
# second006 = (begin; raise ArgumentError, "x"; rescue => y006; y006; end)
# p(first006 == second006)
