# frozen_string_literal: true
require 'set'

# Set#flatten!
a319 = Set[Set[1, 2], Set[3]]; a319.flatten!; p(a319.to_a.sort)
b320 = Set[Set[1, 2], Set[3]]; c320 = (b320.flatten!); p(c320.to_a.sort)
