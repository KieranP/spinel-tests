# frozen_string_literal: true
require 'set'

# Set#tap
a010 = Set[1, 2, 3]; p(a010.tap { |o| o }.object_id == a010.object_id)
a011 = Set[1, 2, 3]; v011 = a011.tap { |o| o }; p(v011.object_id == a011.object_id)
a110 = Set[1, 2, 3]; p(a110.tap { |o| o }.equal?(a110))
a111 = Set[1, 2, 3]; v111 = a111.tap { |o| o }; p(v111.equal?(a111))
