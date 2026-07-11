# frozen_string_literal: true
# Kernel#__callee__
def m341; __callee__; end
p(m341)
v341 = m341; p v341
p(m341.class)
p(__callee__)

# __callee__ answers the name the method was CALLED by — the alias, not the definition
class Callee342
  def a; __callee__; end
  alias b a
  alias_method :c, :a
end
p(Callee342.new.a)
p(Callee342.new.b)
v342 = Callee342.new.c; p v342

# a top-level alias is not registered at all
def tl343; __callee__; end
alias tl344 tl343
p(tl343)
r343 = (tl344 rescue $!.class); p r343
