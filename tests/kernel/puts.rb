# frozen_string_literal: true
# Kernel#puts of nested arrays
puts [[1, 2], [3, 4]]
c030 = [[1, 2], [3, 4]]; puts c030
puts [1, [2, [3]]]
c031 = [1, [2, [3]]]; puts c031

# puts flattens arrays, prints a bare newline for nil / [] / no arguments
puts []
puts nil
puts [nil]
puts [[]]
puts "a\n"
puts 1, 2
puts
puts [1, nil, 2]
puts :sym
puts 1.5
puts true
c032 = []; puts c032
c033 = [1, [2, [3]]]; puts c033
v034 = puts("x"); p v034
