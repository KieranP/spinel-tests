# frozen_string_literal: true
# File.dirname
p File.dirname("/a/b/c.rb")
a001 = "/a/b/c.rb"; p File.dirname(a001)
v001 = File.dirname("/a/b/c.rb"); p v001
p File.dirname("c.rb")
v002 = File.dirname("c.rb"); p v002
p File.dirname("abc")
v003 = File.dirname("abc"); p v003
p File.dirname("/")
v004 = File.dirname("/"); p v004
p File.dirname("a/b/c")
v005 = File.dirname("a/b/c"); p v005
p File.dirname("/a")
v006 = File.dirname("/a"); p v006
p File.dirname(".")
v007 = File.dirname("."); p v007
p File.dirname("/a/b/c", 2)
b001 = 2; p File.dirname("/a/b/c", b001)
r001 = (File.dirname("/a/b/c", 2) rescue $!.class); p r001
