# frozen_string_literal: true
# File.new
p001 = "/tmp/sp_file_new_1"
File.write(p001, "hello")
# File.open works, shown as contrast
o001 = File.open(p001); p o001.read; o001.close
v001 = File.open(p001); s001 = v001.read; v001.close; p s001
r001 = (begin; f001 = File.new(p001); t001 = f001.read; f001.close; t001; rescue => e001; e001.class.name; end)
p r001
File.delete(p001)
