# frozen_string_literal: true
# File::Stat#gid
p001 = "/tmp/sp_filestat_gid"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).gid
p st001.gid
p st002.gid
v001 = st001.gid; p v001

f001.close
File.delete(p001)
