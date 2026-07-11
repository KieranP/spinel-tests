# frozen_string_literal: true
# Dir#to_a
d001 = "/tmp/sp_dir_to_a_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/a", "")

# Dir includes Enumerable, so #to_a lists the directory. Rescue-wrapped so the
# rest of the file still runs where the mixin is unavailable.
h001 = Dir.new(d001)
r001 = (h001.to_a.sort rescue $!.class); p r001
h001.close

h002 = Dir.new(d001)
r002 = (h002.to_a.length rescue $!.class); p r002
h002.close

File.delete("#{d001}/a"); Dir.rmdir(d001)
