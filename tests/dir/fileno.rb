# frozen_string_literal: true
# Dir#fileno
d001 = "/tmp/sp_dir_fileno_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
dd001 = Dir.new(d001)
p (dd001.fileno.class rescue $!.class)
dd001.close
dd002 = Dir.new(d001)
r001 = (dd002.fileno.class rescue $!.class); p r001
dd002.close
a001 = d001
dd003 = Dir.new(a001)
r002 = (dd003.fileno.is_a?(Integer) rescue $!.class); p r002
dd003.close
File.delete("#{d001}/x"); Dir.rmdir(d001)
