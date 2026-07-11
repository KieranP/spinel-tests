# frozen_string_literal: true
# Dir.children
d001 = "/tmp/sp_dir_children_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/b", "")
File.write("#{d001}/a", "")
p Dir.children(d001).sort
a001 = d001
v001 = Dir.children(a001); p v001.sort
p (Dir.children(d001).sort == ["a", "b"])
v002 = Dir.children(d001).sort; p v002
r001 = (begin; c001 = Dir.new(d001).children; c001.sort.to_s; rescue => e001; e001.class.to_s; end); p r001
File.delete("#{d001}/a"); File.delete("#{d001}/b"); Dir.rmdir(d001)

# Iterating the chained result while deleting skips entries; the same list bound to a
# local first iterates completely.
d002 = "/tmp/sp_dir_children_2"
Dir.mkdir(d002) unless Dir.exist?(d002)
["a", "b", "c"].each { |n002| File.write("#{d002}/#{n002}", "") }
seen002 = []
Dir.children(d002).each { |n003| seen002 << n003; File.delete("#{d002}/#{n003}") }
p seen002.sort
v003 = Dir.children(d002).sort; p v003
Dir.children(d002).each { |n004| File.delete("#{d002}/#{n004}") }
Dir.children(d002).each { |n005| File.delete("#{d002}/#{n005}") }
Dir.rmdir(d002) if Dir.exist?(d002) && Dir.children(d002).empty?
