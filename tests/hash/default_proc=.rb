# frozen_string_literal: true
# Hash#default_proc=
h = {}; h.default_proc = ->(hh, k) { k.to_s }; p h[:x]
dp1 = {}; dp1.default_proc = ->(hh, k) { k.to_s }; p dp1[:y]

# Only an inline `->` lambda literal at the call site is accepted; proc {},
# Proc.new {} and a lambda held in a local are refused before any C is emitted.
# Kept commented: the front-end reject takes down the whole file.
dp549 = {}; dp549.default_proc = proc { |hh549, k549| k549.to_s }; p dp549[:x]
dp550 = {}; dp550.default_proc = Proc.new { |hh550, k550| k550.to_s }; p dp550[:x]
l551 = lambda { |hh551, k551| k551.to_s }; dp551 = {}; dp551.default_proc = l551; p dp551[:x]
# Control: the inline lambda literal compiles and matches, and the assignment
# returns the proc.
dp552 = {}; dp552.default_proc = ->(hh552, k552) { k552.to_s }; p dp552[:z]
# The value of the assignment expression compiles with an incompatible-pointer
# warning (the printed class is still right).
dp553 = {}; r553 = (dp553.default_proc = ->(hh553, k553) { k553.to_s }); p r553.class
