# frozen_string_literal: true
# Kernel#__dir__ (the directory of the current source file; the path itself is
# environment-dependent, so only its type is diffable)
p(__dir__.is_a?(String))
v491 = __dir__; p(v491.is_a?(String))
