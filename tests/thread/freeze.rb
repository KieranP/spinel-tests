# frozen_string_literal: true
# Thread#freeze

a001 = Thread.new { 1 }
a001.join
p a001.freeze.class
a002 = Thread.new { 2 }
a002.join
c002 = a002.freeze
p c002.class
p c002.value
p c002.frozen?
