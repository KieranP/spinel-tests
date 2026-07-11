# frozen_string_literal: true
# File.open
p001 = "/tmp/sp_file_open_1"
File.write(p001, "hello\n")
File.open(p001, "r") { |f| p f.read }
a001 = p001; b001 = "r"
File.open(a001, b001) { |f| v001 = f.read; p v001 }
File.open(p001, "w") { |f| f.write("new") }
p File.read(p001)
File.open(p001, "a") { |f| f.write("+more") }
p File.read(p001)
File.open(p001, "r+") { |f| f.write("XX") }
p File.read(p001)
File.open(p001, "w+") { |f| f.write("data"); f.rewind; p f.read }
File.open(p001, "a+") { |f| f.write("Z"); f.rewind; p f.read }
File.open(p001, "w", 0644) { |f| f.write("perm") }
p File.read(p001)
v002 = File.read(p001); p v002
File.delete(p001)

p002 = "/tmp/sp_file_open_intmode"
File.open(p002, File::WRONLY | File::CREAT | File::TRUNC) { |f| f.write("x") }
p File.read(p002)
File.delete(p002)

p003 = "/tmp/sp_file_open_modekw"
r001 = (begin; File.open(p003, mode: "w") { |f| f.write("x") }; File.read(p003); rescue => e001; e001.class; end); p r001
File.delete(p003) if File.exist?(p003)
