# frozen_string_literal: true
# File.socket?
p001 = "/tmp/sp_file_socket_1"
File.write(p001, "hi")
p File.socket?(p001)
a001 = p001; p File.socket?(a001)
v001 = File.socket?(p001); p v001
File.delete(p001)
