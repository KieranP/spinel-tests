# frozen_string_literal: true
# File.absolute_path?
p File.absolute_path?("/a/b/c")
a001 = "/a/b/c"; p File.absolute_path?(a001)
v001 = File.absolute_path?("/a/b/c"); p v001
p File.absolute_path?("a/b/c")
v002 = File.absolute_path?("a/b/c"); p v002
p File.absolute_path?("./rel")
v003 = File.absolute_path?("./rel"); p v003
p File.absolute_path?("~/x")
v004 = File.absolute_path?("~/x"); p v004
p File.absolute_path?("")
v005 = File.absolute_path?(""); p v005
