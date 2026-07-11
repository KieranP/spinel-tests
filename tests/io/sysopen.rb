# frozen_string_literal: true
# IO.sysopen
p001 = "/tmp/sp_io_sysopen_1.txt"
File.write(p001, "hello world\n")
p IO.sysopen(p001).class
a001 = IO.sysopen(p001); p a001.class
File.delete(p001)
