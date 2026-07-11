# frozen_string_literal: true
# File.split
p File.split("/a/b/c.rb")
a001 = "/a/b/c.rb"; p File.split(a001)
v001 = File.split("/a/b/c.rb"); p v001
r001 = (File.split("/a/b/c.rb") rescue $!.class); p r001
