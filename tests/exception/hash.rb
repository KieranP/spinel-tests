# frozen_string_literal: true
# Exception#hash
# hash is an Integer and is stable for the same object
p(RuntimeError.new("m").hash.class)
e001 = RuntimeError.new("m"); p(e001.hash == e001.hash)
h002 = RuntimeError.new("m").hash; p h002.class
