# frozen_string_literal: true
# Enumerator#+
a046 = [1, 2].each + [3, 4].each; p(a046.to_a)
b046 = [1, 2].each + [3, 4].each; b046.each { |x| p x }
p(([1, 2].each + [3, 4].each).class)
c046 = [10, 20].each; d046 = [30].each; e046 = c046 + d046; p(e046.to_a)
