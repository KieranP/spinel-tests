# frozen_string_literal: true
class Box001; X001 = 1; end

# Class#const_set (re-assigning a constant the program already declares)
Box001.const_set(:X001, 99); p(Box001::X001)
r001 = Box001.const_set(:X001, 42); p r001
# const_set of a name the program never declares has no compile-time storage:
# runtime structural mutation of a class through an explicit receiver.
# WONTFIX: See docs/limitations.md - "Fundamental limits — Runtime structural mutation of a class through an explicit receiver"
# Box001.const_set(:Z001, 5); p(Box001::Z001)
