# frozen_string_literal: true
# File::Stat#size
p001 = "/tmp/sp_filestat_size"
File.write(p001, "hello")
st001 = File.stat(p001)
p File.stat(p001).size
p st001.size
f001 = File.open(p001); p f001.stat.size; f001.close
v001 = st001.size; p v001
File.delete(p001)
