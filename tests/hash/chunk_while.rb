# frozen_string_literal: true
# Hash#chunk_while
# The Enumerator it returns compiles, then answers no method.
r001 = ({ a: 1, b: 2, c: 3 }.chunk_while { |x001, y001| y001[1] == x001[1] + 1 }.to_a rescue $!.class); p r001
a002 = { a: 1, b: 2, c: 3 }; r002 = (a002.chunk_while { |x002, y002| y002[1] == x002[1] + 1 }.to_a rescue $!.class); p r002
a003 = { "a" => 1, "b" => 3 }; r003 = (a003.chunk_while { |x003, y003| y003[1] == x003[1] + 1 }.to_a rescue $!.class); p r003
r004 = ({}.chunk_while { |x004, y004| x004 == y004 }.to_a rescue $!.class); p r004
