# frozen_string_literal: true
# Dir#each_entry
d001 = "/tmp/sp_dir_each_entry_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write("#{d001}/a", "")

h001 = Dir.new(d001)
r001 = (h001.each_entry { |e| }.class rescue $!.class); p r001
h001.close

# Collecting through the block is refused before any C is emitted, so this form is
# kept commented — a front-end reject takes down the file despite the rescue.
h002 = Dir.new(d001)
seen002 = []
r002 = ((h002.each_entry { |e| seen002 << e }; seen002.sort) rescue $!.class); p r002
h002.close

File.delete("#{d001}/a"); Dir.rmdir(d001)
