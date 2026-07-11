# frozen_string_literal: true
# Kernel#open
p001 = "/tmp/sp_kernel_open_1.txt"
File.write(p001, "hello world\n")
r001 = open(p001) { |f| f.read }; p r001
f001 = open(p001); a001 = f001.read; f001.close; p a001
File.delete(p001)
