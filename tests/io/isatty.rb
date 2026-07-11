# frozen_string_literal: true
# IO#isatty
p STDOUT.isatty.class
p STDIN.isatty.class
p STDERR.isatty.class
c001 = STDOUT.isatty.class; p c001
p001 = "/tmp/sp_io_isatty_1.txt"
File.write(p001, "x")
File.open(p001) { |f| p f.isatty }
File.open(p001) { |f| a001 = f.isatty; p a001 }
File.delete(p001)
