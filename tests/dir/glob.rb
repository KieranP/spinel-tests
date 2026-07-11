# frozen_string_literal: true
# Dir.glob
d001 = "/tmp/sp_dir_glob_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/a1", "")
File.write("#{d001}/a2", "")
p Dir.glob("#{d001}/*").sort.map { |x001| x001.sub("#{d001}/", "") }
a001 = "#{d001}/*"
v001 = Dir.glob(a001); p v001.sort.map { |x002| x002.sub("#{d001}/", "") }
b001 = []; Dir.glob("#{d001}/*") { |e001| b001 << e001.sub("#{d001}/", "") }; p b001.sort
p Dir["#{d001}/*"].sort
c001 = Dir["#{d001}/*"]; p c001.sort
Dir.mkdir("#{d001}/sub") unless Dir.exist?("#{d001}/sub")
File.write("#{d001}/sub/deep.txt", "")
File.write("#{d001}/top.txt", "")
p Dir.glob("#{d001}/**/*.txt").sort.map { |x003| x003.sub("#{d001}/", "") }
a002 = "#{d001}/**/*.txt"
v002 = Dir.glob(a002); p v002.sort.map { |x004| x004.sub("#{d001}/", "") }
r002 = (Dir.glob(["#{d001}/*.txt", "#{d001}/sub/*.txt"]).sort.map { |x005| x005.sub("#{d001}/", "") } rescue $!.class); p r002
r003 = (Dir.glob("#{d001}/*", File::FNM_DOTMATCH).sort.map { |x006| x006.sub("#{d001}/", "") } rescue $!.class); p r003
File.delete("#{d001}/sub/deep.txt"); File.delete("#{d001}/top.txt"); Dir.rmdir("#{d001}/sub")
File.delete("#{d001}/a1"); File.delete("#{d001}/a2"); Dir.rmdir(d001)
