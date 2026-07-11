# frozen_string_literal: true
# Hash#freeze
a039 = { a: 1 }; a039.freeze; p(a039.frozen?)
a040 = { a: 1 }; v040 = a040.freeze; p(v040.frozen?)
# mutating a frozen hash raises FrozenError
a041 = { a: 1 }.freeze; r041 = (a041.store(:b, 2) rescue $!.class); p r041
a042 = { a: 1 }.freeze; r042 = (a042.merge!({ c: 3 }) rescue $!.class); p r042
a043 = { a: 1 }.freeze; r043 = (a043.delete(:a) rescue $!.class); p r043
