# frozen_string_literal: true
# Kernel#abort — raises SystemExit with status 1; the message goes to stderr
begin; abort; rescue SystemExit => e001; p e001.status; p e001.success?; end
begin; abort("bye"); rescue SystemExit => e002; p e002.message; end
v003 = (begin; abort("m"); rescue SystemExit => e003; e003.status; end); p v003
p(SystemExit.ancestors.include?(StandardError))
