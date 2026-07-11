# frozen_string_literal: true
# TrueClass#enum_for / FalseClass#enum_for
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(true.enum_for(:itself).class)    # Ruby Enumerator; Spinel raises NoMethodError (unsupported)
# p(false.enum_for(:itself).class)   # Ruby Enumerator; Spinel raises NoMethodError (unsupported)
