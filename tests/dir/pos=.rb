# frozen_string_literal: true
# Dir#pos=
d001 = "/tmp/sp_dir_pos_set_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
dd001 = Dir.new(d001)
p001 = dd001.pos
r001 = ((dd001.pos = p001) rescue $!.class); p r001
dd001.close
File.delete("#{d001}/x"); Dir.rmdir(d001)
