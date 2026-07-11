# frozen_string_literal: true
# TrueClass#tap
a010 = true; p(a010.tap { |o| o }.equal?(a010))
a011 = true; v011 = a011.tap { |o| o }; p(v011.equal?(a011))

# FalseClass#tap
a055 = false; p(a055.tap { |o| o }.equal?(a055))
a056 = false; v056 = a056.tap { |o| o }; p(v056.equal?(a056))

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
# true.tap    # Ruby LocalJumpError; Spinel raises NoMethodError (unsupported)
