# frozen_string_literal: true
# IO#advise
p001 = "/tmp/sp_io_advise_1.txt"
File.write(p001, "hello world")
File.open(p001) { |f| p f.advise(:sequential) }
File.open(p001) { |f| p f.advise(:normal) }
File.open(p001) { |f| p f.advise(:willneed, 0, 4) }
File.open(p001) do |f|
  a001 = f.advise(:sequential)
  p a001
end
File.delete(p001)
