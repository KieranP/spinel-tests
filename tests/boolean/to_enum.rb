# frozen_string_literal: true
# TrueClass#to_enum / FalseClass#to_enum
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# p(true.to_enum(:itself).class)    # Ruby Enumerator; Spinel raises NoMethodError (unsupported)
# p(false.to_enum(:itself).class)   # Ruby Enumerator; Spinel raises NoMethodError (unsupported)
