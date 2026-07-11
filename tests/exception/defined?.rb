# frozen_string_literal: true
# defined?(<Exception class>)
p(defined?(RuntimeError))
p(defined?(StandardError))
v001 = defined?(ArgumentError); p v001

# control: non-Exception constants resolve correctly in both
p(defined?(Integer))
p(defined?(Comparable))
