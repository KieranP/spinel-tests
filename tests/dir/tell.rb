# frozen_string_literal: true
# Dir#tell
d001 = "/tmp/sp_dir_tell_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
r001 = (begin; dd001 = Dir.new(d001); t001 = dd001.tell; c001 = t001.class; dd001.close; c001.to_s; rescue => e001; e001.class.to_s; end); p r001
r002 = (begin; dd002 = Dir.new(d001); dd002.read; t002 = dd002.tell; dd002.close; t002.is_a?(Integer).to_s; rescue => e002; e002.class.to_s; end); p r002
a001 = d001
r003 = (begin; dd003 = Dir.new(a001); t003 = dd003.tell; dd003.close; t003.is_a?(Integer).to_s; rescue => e003; e003.class.to_s; end); p r003
File.delete("#{d001}/x"); Dir.rmdir(d001)
