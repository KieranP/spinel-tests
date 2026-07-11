# frozen_string_literal: true
# Hash#slice_before
# The Enumerator it returns compiles, then answers no method.
r001 = ({ a: 1, b: 2, c: 3 }.slice_before { |pr001| pr001[1] == 2 }.to_a rescue $!.class); p r001
a002 = { a: 1, b: 2, c: 3 }; r002 = (a002.slice_before { |pr002| pr002[1] == 2 }.to_a rescue $!.class); p r002
a003 = { "a" => 1, "b" => 2 }; r003 = (a003.slice_before { |pr003| pr003[0] == "b" }.to_a rescue $!.class); p r003
