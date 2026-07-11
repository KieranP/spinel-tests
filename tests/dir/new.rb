# frozen_string_literal: true
# Dir.new
d001 = "/tmp/sp_dir_new_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (Dir.new(d001).class rescue $!.class); p r001
File.delete("#{d001}/x"); Dir.rmdir(d001)
