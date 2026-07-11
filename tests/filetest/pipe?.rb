# frozen_string_literal: true
# FileTest.pipe?
f001 = "/tmp/sp_ft_pipe_f"
File.write(f001, "hello")
n001 = "/tmp/sp_ft_pipe_none"
p FileTest.pipe?(f001)
p FileTest.pipe?(n001)
r001 = FileTest.pipe?(f001); p r001
r002 = FileTest.pipe?(n001); p r002
File.delete(f001)
