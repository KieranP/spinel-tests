# frozen_string_literal: true
# TrueClass#singleton_class / FalseClass#singleton_class
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#singleton_class / class << obj"
# p(true.singleton_class)    # Ruby TrueClass;  Spinel: unsupported (front-end reject)
# p(false.singleton_class)   # Ruby FalseClass; Spinel: unsupported (front-end reject)
