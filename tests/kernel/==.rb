# frozen_string_literal: true
# Kernel#==
p(Object.new == Object.new)
a031 = Object.new; b031 = Object.new; p(a031 == b031)
a032 = Object.new; v032 = (a032 == a032); p v032
