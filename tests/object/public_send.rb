# frozen_string_literal: true
# Kernel#public_send
p("hi".public_send(:upcase))
v107 = "hi".public_send(:upcase); p v107
p(5.public_send(:+, 1))
v108 = 5.public_send(:+, 1); p v108
a107 = [3, 1, 2]; v109 = a107.public_send(:sort); p v109
# Nested send-family dispatch (public_send invoking public_send) aborts compilation:
p("hi".public_send(:public_send, :upcase))

class Api195
  def add(a, b); a + b; end
  private def hidden; 42; end
end
# public_send a user method with arguments
p(Api195.new.public_send(:add, 2, 3))
v110 = Api195.new.public_send(:add, 2, 3); p v110
o110 = Api195.new; v111 = o110.public_send(:add, 5, 6); p v111
# public_send refuses a private method -> NoMethodError (unlike send)
r195 = (Api195.new.public_send(:hidden) rescue $!.class); p r195
