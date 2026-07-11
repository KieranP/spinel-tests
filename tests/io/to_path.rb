# frozen_string_literal: true
# IO#to_path
p001 = "/tmp/sp_io_to_path_1.txt"
File.write(p001, "x")
File.open(p001) { |f| p f.to_path }
r001 = File.open(p001) { |f| f.to_path }; p r001
File.open(p001) do |f|
  a001 = f.to_path
  p a001
end
File.delete(p001)
