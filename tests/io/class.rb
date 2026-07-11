# frozen_string_literal: true
# IO#class (STDOUT / STDERR / STDIN standard streams)
p STDOUT.class
p STDERR.class
p STDIN.class
c001 = STDOUT.class; p c001
c002 = STDERR.class; p c002
c003 = STDIN.class; p c003

p $stdout.class
p $stderr.class
x001 = $stdout; p x001.class

