# frozen_string_literal: true
module M001
  module_function
  def helper; 42; end
end
module M002
  def util; 7; end
  module_function :util
end

# Module#module_function (declarative, in module body)
p(M001.helper)
v001 = M001.helper; p v001
p(M002.util)
v002 = M002.util; p v002

# a module_function method taking arguments, called on the module
module M003
  module_function
  def twice(n); n * 2; end
end
p(M003.twice(3))
v003 = M003.twice(4); p v003

# module_function also makes a PRIVATE instance copy, so an including class can
# call it without a receiver.
module M004
  module_function
  def helper4(x); x * 2; end
end
class Use004; include M004; def go; helper4(3); end; end
p(Use004.new.go)
module M005
  module_function
  def helper5; 6; end
end
class Use005; include M005; def go; helper5; end; end
p(Use005.new.go)
