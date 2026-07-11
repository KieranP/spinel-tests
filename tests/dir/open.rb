# frozen_string_literal: true
# Dir.open
d001 = "/tmp/sp_dir_open_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (Dir.open(d001).class rescue $!.class); p r001
r002 = (begin; a001 = []; Dir.open(d001) { |d002| a001 = d002.children }; a001.sort.to_s; rescue => e001; e001.class.to_s; end); p r002
File.delete("#{d001}/x"); Dir.rmdir(d001)
