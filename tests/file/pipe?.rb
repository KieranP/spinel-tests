# frozen_string_literal: true
# File.pipe?
p001 = "/tmp/sp_file_pipe_1"
File.write(p001, "hi")
p File.pipe?(p001)
a001 = p001; p File.pipe?(a001)
v001 = File.pipe?(p001); p v001
r001 = (File.pipe?(p001) rescue $!.class); p r001
File.delete(p001)
