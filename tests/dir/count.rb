# frozen_string_literal: true
# Dir#count
d001 = "/tmp/sp_dir_count_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/a", "")

# Dir includes Enumerable in Ruby, so #count works on a Dir instance. Spinel refuses
# the call before emitting C, so the whole probe is kept commented — a front-end
# reject takes down the file even though every call is behind a rescue.
h001 = Dir.new(d001)
r001 = (h001.count rescue $!.class); p r001
h001.close
#
h002 = Dir.new(d001)
r002 = (h002.count { |e| e == "a" } rescue $!.class); p r002
h002.close

File.delete("#{d001}/a"); Dir.rmdir(d001)
