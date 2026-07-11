# frozen_string_literal: true
# Method#original_name
def dbl(n) = n * 2

class Foo
  def bar; 1; end
  alias baz bar
end

# original_name is the method's defining name (resolving aliases to the original).
# `original_name` on a Method receiver front-end rejects, so all forms are commented.
p(method(:dbl).original_name)
m001 = method(:dbl); v001 = m001.original_name; p v001
p(Foo.new.method(:baz).original_name)
