# frozen_string_literal: true
# FileTest.socket?
f001 = "/tmp/sp_ft_socket_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_socket_none"
r001 = (FileTest.socket?(f001) rescue $!.class); p r001
r002 = (FileTest.socket?(n001) rescue $!.class); p r002
File.delete(f001)
