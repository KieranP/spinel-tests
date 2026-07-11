# frozen_string_literal: true
# File.mkfifo
p001 = "/tmp/sp_file_mkfifo_1"
File.delete(p001) if File.exist?(p001)
r001 = (File.mkfifo(p001) rescue $!.class); p r001
File.delete(p001) if File.exist?(p001)
a001 = "/tmp/sp_file_mkfifo_2"
r002 = (File.mkfifo(a001) rescue $!.class); p r002
File.delete(a001) if File.exist?(a001)
