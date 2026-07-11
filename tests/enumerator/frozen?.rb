# frozen_string_literal: true
# Enumerator#frozen?
p([1, 2, 3].each.frozen?)
a004 = [1, 2, 3].each; p(a004.frozen?)
a005 = [1, 2, 3].each; v005 = a005.frozen?; p v005
