# frozen_string_literal: true
# IO#flush
p001 = "/tmp/sp_io_flush_1.txt"
File.open(p001, "w") { |f| f.write("x"); f.flush }
p File.read(p001)
File.open(p001, "w") { |f| f.write("a"); f.flush; f.write("b"); f.flush }
p File.read(p001)
STDOUT.write("before-flush\n")
STDOUT.flush

# IO#flush return value: CRuby returns self (the IO); Spinel does not.
File.open(p001, "w") { |f| f.write("x"); r001 = f.flush; p r001.equal?(f) }
File.open(p001, "w") { |f| f.write("x"); p f.flush.class }

File.delete(p001)
