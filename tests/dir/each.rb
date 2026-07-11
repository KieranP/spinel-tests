# frozen_string_literal: true
# Dir#each
d001 = "/tmp/sp_dir_each_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (begin; d002 = Dir.new(d001); a001 = []; d002.each { |e002| a001 << e002 }; d002.close; a001.sort.to_s; rescue => e001; e001.class.to_s; end); p r001
File.delete("#{d001}/x"); Dir.rmdir(d001)
