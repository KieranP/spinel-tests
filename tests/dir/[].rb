# frozen_string_literal: true
# Dir.[]
d001 = "/tmp/sp_dir_bracket_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/a1", "")
File.write("#{d001}/a2", "")
p Dir["#{d001}/*"].sort
v001 = Dir["#{d001}/*"]; p v001.sort
File.delete("#{d001}/a1"); File.delete("#{d001}/a2"); Dir.rmdir(d001)
