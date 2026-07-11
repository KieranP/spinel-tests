# frozen_string_literal: true
# Dir#close
d001 = "/tmp/sp_dir_close_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
p (begin; dd001 = Dir.new(d001); dd001.close; rescue => e001; e001.class; end)
r001 = (begin; dd002 = Dir.new(d001); v001 = dd002.close; v001.inspect; rescue => e002; e002.class.to_s; end); p r001
r002 = (begin; dd003 = Dir.new(d001); dd003.close; dd003.close; "ok"; rescue => e003; e003.class.to_s; end); p r002
a001 = d001
r003 = (begin; dd004 = Dir.new(a001); w001 = dd004.close; w001.nil?.to_s; rescue => e004; e004.class.to_s; end); p r003
File.delete("#{d001}/x"); Dir.rmdir(d001)
