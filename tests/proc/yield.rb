# frozen_string_literal: true
# Proc#yield
l230 = ->(x) { x * 2 }; p(l230.yield(5))
a230 = ->(x) { x * 2 }; b230 = (a230.yield(5)); p(b230)
l231 = ->(x) { x * 2 }; p(l231.call(5))
p(->(x) { x * 2 }[5])
p(->(x) { x * 2 }.(5))
# yield with multiple args and proc auto-splat of a single array
my010 = ->(a, b) { [a, b] }; p(my010.yield(1, 2))
v010 = my010.yield(1, 2); p(v010)
py011 = proc { |a, b| [a, b] }; p(py011.yield([1, 2]))
v011 = py011.yield([1, 2]); p(v011)
my012 = ->(a, b) { [a, b] }; args012 = [1, 2]; p(my012.yield(*args012))
# yield on a non-lambda proc pads missing arguments with nil and drops extras
py020 = proc { |a, b| [a, b] }; p(py020.yield(1))
v020 = py020.yield(1); p(v020)
p(py020.yield(1, 2, 3))
v021 = py020.yield(1, 2, 3); p(v021)
# yield on a lambda is strict
ly022 = ->(a, b) { [a, b] }; r022 = (ly022.yield(1) rescue $!.class); p(r022)
# yield with keyword and block arguments
ky023 = ->(a, k: 5) { [a, k] }; p(ky023.yield(1, k: 9))
v023 = ky023.yield(1, k: 9); p(v023)
by024 = ->(&blk024) { blk024.call(4) }; p(by024.yield { |x024| x024 + 1 })
v024 = by024.yield { |x024b| x024b + 1 }; p(v024)
# yield on a proc held in a local and reached through several call sites
ly025 = ->(x) { x * 2 }
p([ly025.yield(1), ly025.yield(2), ly025.yield(3)])
v025 = [ly025.yield(4), ly025.yield(5)]; p(v025)
