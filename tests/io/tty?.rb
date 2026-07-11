# frozen_string_literal: true
# IO#tty?
p STDOUT.tty?.class
p STDIN.tty?.class
p STDERR.tty?.class
c001 = STDOUT.tty?.class; p c001
p001 = "/tmp/sp_io_tty_1.txt"
File.write(p001, "x")
File.open(p001) { |f| p f.tty? }
File.open(p001) { |f| a001 = f.tty?; p a001 }
File.delete(p001)
