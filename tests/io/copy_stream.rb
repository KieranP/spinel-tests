# frozen_string_literal: true
# IO.copy_stream
p001 = "/tmp/sp_io_copy_src_1.txt"
p002 = "/tmp/sp_io_copy_dst_1.txt"
File.write(p001, "hello world\n")
p IO.copy_stream(p001, p002)
a001 = IO.copy_stream(p001, p002); p a001
File.delete(p001)
