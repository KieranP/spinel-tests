# frozen_string_literal: true
# File::Stat#nlink
p001 = "/tmp/sp_filestat_nlink"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).nlink
p st001.nlink
p st002.nlink
v001 = st001.nlink; p v001

f001.close
File.delete(p001)
