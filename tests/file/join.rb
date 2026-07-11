# frozen_string_literal: true
# File.join
p File.join("a", "b", "c")
a001 = "a"; b001 = "b"; p File.join(a001, b001)
v001 = File.join("a", "b", "c"); p v001
p File.join("/a", "b")
v002 = File.join("/a", "b"); p v002
p File.join()
v003 = File.join(); p v003
p File.join("a")
v004 = File.join("a"); p v004
p File.join("a", "b", "c")
v005 = File.join("a", "b", "c"); p v005
p File.join("a/", "b")
v006 = File.join("a/", "b"); p v006
p File.join("a", "", "b")
v007 = File.join("a", "", "b"); p v007
p File.join("a", "/b")
v008 = File.join("a", "/b"); p v008
p File.join(["a", "b"], "c")
v009 = File.join(["a", "b"], "c"); p v009
