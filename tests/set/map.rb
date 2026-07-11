# frozen_string_literal: true
require 'set'

# Set#map
p(Set.new([1, 2, 3]).map { |x| x })
sm001 = Set.new([1, 2, 3]); p(sm001.map { |x| x * 2 })
sm002 = Set.new([1, 2, 3]); csm002 = sm002.map { |x| x * 2 }; p csm002

hcr = { a: Set.new([1, 2, 3]) }; hmr = (hcr[:a].map { |x| x } rescue $!.class); p hmr
p(Set.new([[1, 2]]).map { |r042, c042| [r042, c042] })
v043 = Set.new([[1, 2]]).map { |r043, c043| r043 }; p v043
