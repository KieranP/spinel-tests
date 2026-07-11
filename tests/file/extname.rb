# frozen_string_literal: true
# File.extname
p File.extname("/a/b/c.rb")
a001 = "/a/b/c.rb"; p File.extname(a001)
v001 = File.extname("/a/b/c.rb"); p v001
p File.extname("/a/b/c")
v002 = File.extname("/a/b/c"); p v002
p File.extname(".bashrc")
a002 = ".bashrc"; p File.extname(a002)
v003 = File.extname(".bashrc"); p v003
p File.extname("a.")
v004 = File.extname("a."); p v004
p File.extname("a.b.c")
v005 = File.extname("a.b.c"); p v005
p File.extname("/a/b")
v006 = File.extname("/a/b"); p v006
p File.extname("a.rb")
v007 = File.extname("a.rb"); p v007
