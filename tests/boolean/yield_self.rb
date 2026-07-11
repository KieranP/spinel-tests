# frozen_string_literal: true
# TrueClass#yield_self

a001 = true
p(a001.yield_self { |o| o.equal?(a001) })

a002 = true
v002 = a002.yield_self { |o| o }
p(v002.equal?(a002))

# FalseClass#yield_self

a003 = false
p(a003.yield_self { |o| o.equal?(a003) })

a004 = false
v004 = a004.yield_self { |o| o }
p(v004.equal?(a004))

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(true.yield_self.class)    # Ruby Enumerator; Spinel raises NoMethodError (unsupported)
