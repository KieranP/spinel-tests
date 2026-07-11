# frozen_string_literal: true
# IO#path
p001 = "/tmp/sp_io_path_1.txt"
File.write(p001, "x")
File.open(p001) { |f| p f.path }
r001 = File.open(p001) { |f| f.path }; p r001
File.open(p001) do |f|
  a001 = f.path
  p a001
end
File.delete(p001)
