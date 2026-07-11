# frozen_string_literal: true
# Kernel#at_exit — handlers run in LIFO order after the main body
at_exit { puts "bye" }
at_exit { puts "second" }
puts "main"

# An at_exit block that references an outer local is rejected at compile time (whole program
# fails to build), so this form is kept commented.
log001 = []; at_exit { log001 << "bye" }; puts log001.inspect

# at_exit answers the Proc it registered
v002 = at_exit { }
p v002.class

# a handler registered from inside a method still runs
def reg003; at_exit { puts "from method" }; end
reg003
