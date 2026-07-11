# frozen_string_literal: true
# Dir.foreach
d001 = "/tmp/sp_dir_foreach_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (begin; a001 = []; Dir.foreach(d001) { |e001| a001 << e001 }; a001.sort.to_s; rescue => e002; e002.class.to_s; end); p r001
File.delete("#{d001}/x"); Dir.rmdir(d001)
