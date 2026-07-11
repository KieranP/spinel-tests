# frozen_string_literal: true
# Method#parameters
def opt1(x, y = 1) = x
def req2(x, y) = x + y

# parameters describes the method's formal parameter list.
# `parameters` on a Method receiver front-end rejects, so all forms are commented.
p(method(:req2).parameters)
m001 = method(:req2); v001 = m001.parameters; p v001
p(method(:opt1).parameters)
