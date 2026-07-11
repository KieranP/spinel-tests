# frozen_string_literal: true
# Hash#slice_when
# The Enumerator it returns compiles, then answers no method.
r001 = ({ a: 1, b: 2, c: 3 }.slice_when { |x001, y001| y001[1] > x001[1] + 1 }.to_a rescue $!.class); p r001
a002 = { a: 1, b: 2, c: 3 }; r002 = (a002.slice_when { |x002, y002| y002[1] > x002[1] + 1 }.to_a rescue $!.class); p r002
a003 = { 1 => "x", 2 => "y" }; r003 = (a003.slice_when { |x003, y003| y003[0] > x003[0] }.to_a rescue $!.class); p r003
