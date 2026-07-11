# frozen_string_literal: true
# TrueClass#__id__
p(true.__id__ == true.object_id)
a001 = true; p(a001.__id__ == a001.object_id)
a002 = true; v002 = a002.__id__; p(v002.is_a?(Integer))
a003 = true; v003 = (a003.__id__ == a003.__id__); p v003

# FalseClass#__id__
p(false.__id__ == false.object_id)
a004 = false; p(a004.__id__ == a004.object_id)
a005 = false; v005 = a005.__id__; p(v005.is_a?(Integer))
a006 = false; v006 = (a006.__id__ == a006.__id__); p v006
