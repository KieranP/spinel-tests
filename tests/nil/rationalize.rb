# frozen_string_literal: true
# NilClass#rationalize
# nil.rationalize returns (0/1).
p(nil.rationalize)
v001 = nil.rationalize; p v001
n001 = nil; p(n001.rationalize)
n002 = nil; v002 = n002.rationalize; p v002
