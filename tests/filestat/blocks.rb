# frozen_string_literal: true
# File::Stat#blocks
p001 = "/tmp/sp_filestat_blocks"
File.write(p001, "hello")
st001 = File.stat(p001)
f001 = File.open(p001)
st002 = f001.stat

# Every call form is refused before any C is emitted, taking down the whole file.
p File.stat(p001).blocks
p st001.blocks
p st002.blocks
v001 = st001.blocks; p v001

f001.close
File.delete(p001)
