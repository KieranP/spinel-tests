# frozen_string_literal: true
# Exception#eql?
# Exception doesn't override eql?; it uses Object#eql? (identity).
e001 = RuntimeError.new("m"); p e001.eql?("m")
e002 = RuntimeError.new("m"); p e002.eql?(nil)
e003 = RuntimeError.new("m"); p e003.eql?(e003)

# Placeholder so the file is valid Ruby and runs under both interpreters.
p(RuntimeError.new("m").message)
