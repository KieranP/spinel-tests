# frozen_string_literal: true
require 'set'

# Set#then
a012 = Set[1, 2, 3]; p(a012.then { |o| o.object_id == a012.object_id })
a013 = Set[1, 2, 3]; v013 = a013.then { |o| o.object_id == a013.object_id }; p v013
a112 = Set[1, 2, 3]; p(a112.then { |o| o.equal?(a112) })
a113 = Set[1, 2, 3]; v113 = a113.then { |o| o.equal?(a113) }; p v113
