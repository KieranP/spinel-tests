# frozen_string_literal: true
# Enumerator#peek_values
e052 = [[1, 2], [3, 4]].each; p(e052.peek_values); p(e052.next_values)
a052 = [10, 20].each; p(a052.peek_values)
b052 = [[1, 2]].each; v052 = b052.peek_values; p(v052)
