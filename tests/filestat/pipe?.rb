# frozen_string_literal: true
# File::Stat#pipe?
p001 = "/tmp/sp_filestat_pipe?"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).pipe?
p st001.pipe?
p st002.pipe?
v001 = st001.pipe?; p v001

f001.close
File.delete(p001)
