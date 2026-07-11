# frozen_string_literal: true
# TrueClass#then
a012 = true; p(a012.then { |o| o.equal?(a012) })
a013 = true; v013 = a013.then { |o| o.equal?(a013) }; p v013

# FalseClass#then
a057 = false; p(a057.then { |o| o.equal?(a057) })
a058 = false; v058 = a058.then { |o| o.equal?(a058) }; p v058

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(true.then.class)    # Ruby Enumerator; Spinel raises NoMethodError (unsupported)
