# frozen_string_literal: true
# IO#putc
p001 = "/tmp/sp_io_putc_1.txt"
STDOUT.putc(65)
STDOUT.putc("A")
File.open(p001, "w") { |f| f.putc(65) }
p File.read(p001)
