# frozen_string_literal: true
# File::Stat#size?
p001 = "/tmp/sp_filestat_size?"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).size?
p st001.size?
p st002.size?
v001 = st001.size?; p v001

f001.close
File.delete(p001)
