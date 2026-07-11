# frozen_string_literal: true
require 'set'

# Set#compare_by_identity
# WONTFIX: See docs/limitations.md - "By design — Hash#compare_by_identity"
# a333 = Set[1, 2]; a333.compare_by_identity; p(a333.compare_by_identity?)
p(:skip)
