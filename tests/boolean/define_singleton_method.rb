# frozen_string_literal: true
# TrueClass#define_singleton_method / FalseClass#define_singleton_method
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# p(true.define_singleton_method(:f) { 1 })    # Ruby :f; Spinel: unsupported (front-end reject)
# p(false.define_singleton_method(:g) { 2 })   # Ruby :g; Spinel: unsupported (front-end reject)
