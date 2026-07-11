# frozen_string_literal: true
# Hash#slice_after
# The Enumerator it returns compiles, then answers no method.
r001 = ({ a: 1, b: 2, c: 3 }.slice_after { |pr001| pr001[1] == 2 }.to_a rescue $!.class); p r001
a002 = { a: 1, b: 2, c: 3 }; r002 = (a002.slice_after { |pr002| pr002[1] == 2 }.to_a rescue $!.class); p r002
a003 = { 1 => "x", 2 => "y" }; r003 = (a003.slice_after { |pr003| pr003[0] == 1 }.to_a rescue $!.class); p r003
