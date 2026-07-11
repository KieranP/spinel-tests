# frozen_string_literal: true
# IO#each_codepoint
p001 = "/tmp/sp_io_each_codepoint_1.txt"
File.write(p001, "abc")
File.open(p001) { |f| f.each_codepoint { |c| p c } }
File.open(p001) do |f|
  a001 = []
  f.each_codepoint { |c| a001 << c }
  p a001
end
File.delete(p001)
