# frozen_string_literal: true
# File::Stat#ino
p001 = "/tmp/sp_filestat_ino"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).ino.class
p st001.ino.class
p st002.ino.class
v001 = st001.ino.class; p v001

f001.close
File.delete(p001)
