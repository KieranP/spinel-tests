# frozen_string_literal: true
# IO#internal_encoding
p001 = "/tmp/sp_io_internal_encoding_1.txt"
File.write(p001, "hi")
# WONTFIX: See docs/limitations.md - "Fundamental limits — Mixed / non-UTF-8 encodings"
# File.open(p001) { |f| p f.internal_encoding }
# File.open(p001) { |f| a001 = f.internal_encoding; p a001 }
File.delete(p001)
