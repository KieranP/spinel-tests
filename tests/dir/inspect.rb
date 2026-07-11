# frozen_string_literal: true
# Dir#inspect
d001 = Dir.new(".")
p(d001.inspect.start_with?("#<Dir"))
v001 = d001.inspect.start_with?("#<Dir"); p v001
p(d001.inspect.class)
