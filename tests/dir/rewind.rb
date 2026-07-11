# frozen_string_literal: true
# Dir#rewind
d001 = "/tmp/sp_dir_rewind_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/x", "")
File.write("#{d001}/y", "")
r001 = (begin; dd001 = Dir.new(d001); a001 = []; dd001.each { |e001| a001 << e001 }; dd001.rewind; b001 = []; dd001.each { |e002| b001 << e002 }; dd001.close; (a001.sort == b001.sort).to_s; rescue => e003; e003.class.to_s; end); p r001
r002 = (begin; dd002 = Dir.new(d001); rv001 = dd002.rewind; c001 = rv001.class; dd002.close; c001.to_s; rescue => e004; e004.class.to_s; end); p r002
a002 = d001
r003 = (begin; dd003 = Dir.new(a002); dd003.read; dd003.rewind; f001 = dd003.read; dd003.close; f001.class.to_s; rescue => e005; e005.class.to_s; end); p r003
File.delete("#{d001}/x"); File.delete("#{d001}/y"); Dir.rmdir(d001)
