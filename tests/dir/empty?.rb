# frozen_string_literal: true
# Dir.empty?
e001 = "/tmp/sp_dir_empty_1"
Dir.mkdir(e001) unless Dir.exist?(e001)
n001 = "/tmp/sp_dir_empty_2"
Dir.mkdir(n001) unless Dir.exist?(n001)
File.write("#{n001}/x", "")
r001 = (Dir.empty?(e001) rescue $!.class); p r001
r002 = (Dir.empty?(n001) rescue $!.class); p r002
File.delete("#{n001}/x"); Dir.rmdir(e001); Dir.rmdir(n001)
