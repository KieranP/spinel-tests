# frozen_string_literal: true
# Dir.entries
d001 = "/tmp/sp_dir_entries_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/b", "")
File.write("#{d001}/a", "")
p Dir.entries(d001).sort
a001 = d001
v001 = Dir.entries(a001); p v001.sort
p Dir.entries(d001).include?(".")
p Dir.entries(d001).include?("..")
v002 = Dir.entries(d001).sort; p (v002.include?("a") && v002.include?("b"))
File.delete("#{d001}/a"); File.delete("#{d001}/b"); Dir.rmdir(d001)
