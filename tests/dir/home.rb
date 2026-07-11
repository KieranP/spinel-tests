# frozen_string_literal: true
# Dir.home
p Dir.home.class
v001 = Dir.home; p v001.class
r001 = (Dir.home(ENV["USER"]).class rescue $!.class); p r001
a001 = ENV["USER"]
r002 = (Dir.home(a001).class rescue $!.class); p r002
