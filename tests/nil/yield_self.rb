# frozen_string_literal: true
# NilClass#yield_self
a048 = nil; p(a048.yield_self { |o| o.nil? })
a049 = nil; v048 = a049.yield_self { |o| o.to_s }; p v048
p(nil.yield_self { |o| 42 })
