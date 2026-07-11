# frozen_string_literal: true
# File.expand_path
p File.expand_path("c.rb", "/a/b")
a001 = "c.rb"; b001 = "/a/b"; p File.expand_path(a001, b001)
v001 = File.expand_path("c.rb", "/a/b"); p v001
p File.expand_path("../c.rb", "/a/b")
v002 = File.expand_path("../c.rb", "/a/b"); p v002
p File.expand_path("/a/b/c.rb")
v003 = File.expand_path("/a/b/c.rb"); p v003
p File.expand_path("../x", "/a/b")
v004 = File.expand_path("../x", "/a/b"); p v004
p File.expand_path("./x", "/a")
v005 = File.expand_path("./x", "/a"); p v005
