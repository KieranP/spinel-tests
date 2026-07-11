# frozen_string_literal: true
# File.fnmatch
p File.fnmatch("*.rb", "c.rb")
a001 = "*.rb"; b001 = "c.rb"; p File.fnmatch(a001, b001)
v001 = File.fnmatch("*.rb", "c.rb"); p v001
r001 = (File.fnmatch("*.rb", "c.rb") rescue $!.class); p r001
