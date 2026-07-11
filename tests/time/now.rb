# frozen_string_literal: true
# Time.now

p Time.now.class

a001 = Time.now
p a001.class

# Time.now is non-deterministic; only its class and monotonicity are stable.
b001 = Time.now
p (b001 >= a001)
