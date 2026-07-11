# frozen_string_literal: true
# File::Stat#uid
p001 = "/tmp/sp_filestat_uid"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).uid
p st001.uid
p st002.uid
v001 = st001.uid; p v001

f001.close
File.delete(p001)
