# frozen_string_literal: true
# Kernel#define_singleton_method
# o083 = Object.new
# o083.define_singleton_method(:foo) { 42 }
# p(o083.foo)                                       # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# v083 = o083.foo; p v083                           # WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
