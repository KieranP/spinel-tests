# frozen_string_literal: true
require 'set'

# Set#itself
a008 = Set[1, 2, 3]; p(a008.itself.object_id == a008.object_id)
a009 = Set[1, 2, 3]; v009 = a009.itself; p(v009.object_id == a009.object_id)
a108 = Set[1, 2, 3]; p(a108.itself.equal?(a108))
a109 = Set[1, 2, 3]; v109 = a109.itself; p(v109.equal?(a109))
