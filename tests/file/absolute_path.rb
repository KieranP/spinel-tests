# frozen_string_literal: true
# File.absolute_path
p File.absolute_path("c.rb", "/a/b")
a001 = "c.rb"; b001 = "/a/b"; p File.absolute_path(a001, b001)
v001 = File.absolute_path("c.rb", "/a/b"); p v001
r001 = (File.absolute_path("c.rb", "/a/b") rescue $!.class); p r001
