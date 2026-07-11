# frozen_string_literal: true
# Method#source_location
def dbl(n) = n * 2

# source_location of a Ruby-defined method is a [file, line] Array
r001 = (method(:dbl).source_location.is_a?(Array) rescue $!.class); p r001
m002 = method(:dbl); r002 = (m002.source_location.is_a?(Array) rescue $!.class); p r002
