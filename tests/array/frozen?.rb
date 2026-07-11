# frozen_string_literal: true
# Array#frozen?
p([1, 2, 3].frozen?)
a004 = [1, 2, 3]; p(a004.frozen?)
a005 = [1, 2, 3]; v005 = a005.frozen?; p v005

# frozen? on an empty Array literal
p([].frozen?)
v872 = [].frozen?; p v872
p([1].frozen?)
g871 = []; p g871.frozen?
g872 = [1]; p g872.frozen?
v872 = [1].frozen?; p v872
g873 = [1].freeze; p g873.frozen?
