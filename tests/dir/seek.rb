# frozen_string_literal: true
# Dir#seek
d001 = "/tmp/sp_dir_seek_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
File.write("#{d001}/y", "")
dd001 = Dir.new(d001)
p001 = dd001.tell
p (dd001.seek(p001).class rescue $!.class)
dd001.close
dd002 = Dir.new(d001)
r001 = (dd002.seek(0).class rescue $!.class); p r001
dd002.close
a001 = d001
dd003 = Dir.new(a001)
r002 = (dd003.seek(0).class rescue $!.class); p r002
dd003.close
File.delete("#{d001}/x"); File.delete("#{d001}/y"); Dir.rmdir(d001)
