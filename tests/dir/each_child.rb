# frozen_string_literal: true
# Dir.each_child
d001 = "/tmp/sp_dir_each_child_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (begin; a001 = []; Dir.each_child(d001) { |e001| a001 << e001 }; a001.sort.to_s; rescue => e002; e002.class.to_s; end); p r001
File.delete("#{d001}/x"); Dir.rmdir(d001)

# Deleting inside Dir.each_child, for contrast with the chained Dir.children form.
d006 = "/tmp/sp_dir_each_child_2"
Dir.mkdir(d006) unless Dir.exist?(d006)
["a", "b", "c"].each { |n006| File.write("#{d006}/#{n006}", "") }
seen006 = []
Dir.each_child(d006) { |n007| seen006 << n007 }
p seen006.sort
v006 = seen006.size; p v006
seen006.each { |n008| File.delete("#{d006}/#{n008}") }
Dir.rmdir(d006) if Dir.exist?(d006)
