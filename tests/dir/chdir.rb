# frozen_string_literal: true
# Dir.chdir
o001 = Dir.pwd
d001 = "/tmp/sp_dir_chdir_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
p Dir.chdir(d001)
p Dir.pwd.class
Dir.chdir(o001)
p Dir.pwd == o001
a001 = d001
v001 = Dir.chdir(a001); p v001
Dir.chdir(o001)
r001 = Dir.chdir(d001) { 42 }; p r001
Dir.chdir(o001)
r002 = (Dir.chdir; Dir.pwd.class) rescue $!.class
Dir.chdir(o001)
p r002
Dir.rmdir(d001)
