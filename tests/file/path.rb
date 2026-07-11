# frozen_string_literal: true
# File.path
p File.path("/a/b")
a001 = "/a/b"; p File.path(a001)
v001 = File.path("/a/b"); p v001
r001 = (File.path("/a/b") rescue $!.class); p r001
