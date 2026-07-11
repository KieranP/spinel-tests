# frozen_string_literal: true
# Kernel#freeze
a039 = Object.new; a039.freeze; p(a039.frozen?)
a040 = Object.new; v040 = a040.freeze; p(v040.frozen?)
a041 = Object.new; p(a041.freeze.equal?(a041))
a042 = Object.new; a042.freeze; p(a042.freeze.frozen?)
a043 = [1, 2].freeze; r043 = (a043 << 3 rescue $!.class); p r043
a044 = { a: 1 }.freeze; r044 = (a044[:b] = 2 rescue $!.class); p r044
a045 = +"ab"; a045.freeze; r045 = (a045 << "c" rescue $!.class); p r045
p([1, 2].freeze.frozen?)
v046 = { a: 1 }.freeze; p(v046.frozen?)
p(1.freeze)
p(:s.freeze)
p(nil.freeze)
