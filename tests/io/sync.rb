# frozen_string_literal: true
# IO#sync=
STDOUT.sync = true
p 1
STDOUT.sync = false
p 2
p001 = "/tmp/sp_io_sync_1.txt"
File.open(p001, "w") { |f| f.sync = true; p 3 }
File.open(p001, "w") { |f| f.sync = false; p 4 }
File.delete(p001)

# IO#sync
p STDOUT.sync
s001 = STDOUT.sync; p s001
