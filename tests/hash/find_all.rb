# frozen_string_literal: true
# Hash#find_all
p({ a: 1, b: 2 }.find_all { |_k, v| v > 1 })
za901 = { a: 1, b: 2 }; zb901 = (za901.find_all { |_k, v| v > 1 }); p zb901
p({ a: 1, b: 2 }.find_all { |_k, v| v > 10 })
za902 = { a: 1, b: 2 }; zb902 = (za902.find_all { |_k, v| v > 10 }); p zb902
p({ a: 1, b: 2 }.find_all { |_k, v| v > 0 })
za903 = { a: 1, b: 2 }; zb903 = (za903.find_all { |_k, v| v > 0 }); p zb903
p({}.find_all { |_k, v| v > 0 })
za904 = {}; zb904 = (za904.find_all { |_k, v| v > 0 }); p zb904
