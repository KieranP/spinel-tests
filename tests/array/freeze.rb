# frozen_string_literal: true
# Array#freeze
a039 = [1, 2, 3]; a039.freeze; p(a039.frozen?)
a040 = [1, 2, 3]; v040 = a040.freeze; p(v040.frozen?)
# mutating a frozen array raises FrozenError
a041 = [1, 2, 3].freeze; r041 = (a041.push(4) rescue $!.class); p r041
a042 = [1, 2, 3].freeze; r042 = (a042.sort! rescue $!.class); p r042
a043 = [1, 2, 3].freeze; r043 = (a043.clear rescue $!.class); p r043

# freeze on an empty Array literal
p([].freeze.frozen?)
v861 = [].freeze.frozen?; p v861
g862 = []; g862.freeze; p g862.frozen?
g863 = [1]; g863.freeze; p g863.frozen?
p([1].freeze.frozen?)
g864 = [1, 2].freeze; v864 = (g864 << 3 rescue $!.class); p v864
