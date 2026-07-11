# frozen_string_literal: true
# File.realdirpath
d001 = "/tmp/sp_file_realdirpath_1"
Dir.mkdir(d001) unless Dir.exist?(d001)
f001 = File.join(d001, "here.txt")
File.write(f001, "x")

## an existing file resolves like realpath
# p File.realdirpath(f001) == File.realpath(f001)
# p File.realdirpath(f001).class
# a001 = f001
# p File.realdirpath(a001) == File.realpath(a001)
# v001 = File.realdirpath(f001); p v001 == File.realpath(f001)

## unlike realpath, the LAST component need not exist
# g002 = File.join(d001, "missing.txt")
# p File.realdirpath(g002).end_with?("/missing.txt")
# p File.realdirpath(g002).class
# v002 = File.realdirpath(g002); p v002.end_with?("/missing.txt")
# p File.realdirpath(g002) == File.join(File.realdirpath(d001), "missing.txt")

## realpath on that same missing name DOES raise
# r003 = (File.realpath(g002) rescue $!.class); p r003

## but a missing intermediate directory still raises
# r004 = (File.realdirpath(File.join(d001, "nodir", "f.txt")) rescue $!.class); p r004

## the two-argument (relative + base dir) form
# p File.realdirpath("here.txt", d001) == File.realpath(f001)
# b005 = "here.txt"
# p File.realdirpath(b005, d001) == File.realpath(f001)
# v005 = File.realdirpath(b005, d001); p v005 == File.realpath(f001)
# p File.realdirpath("missing.txt", d001).end_with?("/missing.txt")

## "." and ".." are collapsed (every traversed component must still exist)
# p File.realdirpath(File.join(d001, ".")) == File.realdirpath(d001)
# p File.realdirpath(File.join(d001, "..", "sp_file_realdirpath_1", "x")).end_with?("/x")
# r007 = (File.realdirpath(File.join(d001, "sub", "..", "x")) rescue $!.class); p r007

## an absolute result is always returned
# p File.realdirpath(g002).start_with?("/")
# c006 = File.realdirpath(d001)
# p c006.start_with?("/")
# p c006.end_with?("sp_file_realdirpath_1")

# File.delete(f001)
# Dir.rmdir(d001)
