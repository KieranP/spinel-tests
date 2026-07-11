# frozen_string_literal: true
# Thread#frozen?

a001 = Thread.new { 1 }
a001.join
p a001.frozen?
a002 = Thread.new { 2 }
a002.join
a002.freeze
p a002.frozen?
a003 = Thread.new { 3 }
a003.join
c003 = a003.frozen?
p c003.class
p c003
