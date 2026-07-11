# frozen_string_literal: true
# Hash#find_index
p({ a: 1, b: 2 }.find_index([:b, 2]))
fi1 = { a: 1, b: 2 }; fi2 = (fi1.find_index([:b, 2])); p fi2
