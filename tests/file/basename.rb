# frozen_string_literal: true
# File.basename
p File.basename("/a/b/c.rb")
a001 = "/a/b/c.rb"; p File.basename(a001)
v001 = File.basename("/a/b/c.rb"); p v001
p File.basename("file.rb")
v002 = File.basename("file.rb"); p v002
p File.basename("/a/b/c")
v003 = File.basename("/a/b/c"); p v003
p File.basename("/a/b/")
v004 = File.basename("/a/b/"); p v004
p File.basename("/")
v005 = File.basename("/"); p v005
p File.basename("a/b//")
v006 = File.basename("a/b//"); p v006
p File.basename("/a/b/c.rb", ".rb")
b001 = ".rb"; p File.basename("/a/b/c.rb", b001)
r001 = (File.basename("/a/b/c.rb", ".rb") rescue $!.class); p r001
