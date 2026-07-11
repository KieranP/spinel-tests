# frozen_string_literal: true
# Dir#read
d001 = "/tmp/sp_dir_read_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (begin; d002 = Dir.new(d001); s001 = d002.read; d002.close; s001.class.to_s; rescue => e001; e001.class.to_s; end); p r001
File.delete("#{d001}/x"); Dir.rmdir(d001)
