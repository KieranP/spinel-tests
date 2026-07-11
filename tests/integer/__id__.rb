# frozen_string_literal: true
# Integer#__id__ (BasicObject#__id__, same identity as #object_id)
# For a Fixnum the id is 2*n+1 in CRuby; assert stable/consistent facts only.
p(5.__id__ == 5.__id__)
p(5.__id__ == 5.object_id)
p(0.__id__ == 1.__id__)
a001 = 5; p(a001.__id__.class)
a002 = 5; c002 = (a002.__id__ == a002.__id__); p c002
