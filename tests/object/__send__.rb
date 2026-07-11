# frozen_string_literal: true
# Kernel#__send__
p("hi".__send__(:upcase))
v104 = "hi".__send__(:upcase); p v104
p([1, 2].__send__(:size))
v105 = [1, 2].__send__(:size); p v105
a102 = [3, 1, 2]; v106 = a102.__send__(:sort); p v106
p(5.__send__(:+, 4))
# Nested send-family dispatch (__send__ invoking __send__/send) aborts compilation:
p("hi".__send__(:__send__, :upcase))
p("hi".__send__(:send, :upcase))
