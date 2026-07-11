# frozen_string_literal: true
# Dir.for_fd
d001 = "/tmp/sp_dir_for_fd_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
File.write(File.join(d001, "a.txt"), "a")

# Dir works normally here, which is what makes the NameError below surprising
p Dir.exist?(d001)

# Dir.for_fd wraps the descriptor of an already-open Dir. The wrapper SHARES the
# fd, so only the wrapper is closed — closing both would double-close it (EBADF).
# Rescue-wrapped so the rest of the file still runs where for_fd is unavailable.
h001 = Dir.new(d001)
r001 = (Dir.for_fd(h001.fileno).class rescue $!.class); p r001
h001.close

h002 = Dir.new(d001)
r002 = (Dir.for_fd(h002.fileno).children.sort rescue $!.class); p r002
h002.close

h003 = Dir.new(d001)
r003 = (Dir.for_fd(h003.fileno).path.inspect rescue $!.class); p r003
h003.close

r004 = (Dir.for_fd(9999) rescue $!.class); p r004
r005 = (Dir.for_fd(-1) rescue $!.class); p r005

File.delete(File.join(d001, "a.txt"))
Dir.rmdir(d001)
