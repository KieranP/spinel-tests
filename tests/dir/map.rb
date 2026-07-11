# frozen_string_literal: true
# Dir#map
d001 = "/tmp/sp_dir_map_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/a", "")

h001 = Dir.new(d001)
r001 = (h001.map { |e| e }.sort rescue $!.class); p r001
h001.close

h002 = Dir.new(d001)
r002 = (h002.map { |e| e.length }.sort rescue $!.class); p r002
h002.close

File.delete("#{d001}/a"); Dir.rmdir(d001)
