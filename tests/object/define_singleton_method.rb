# frozen_string_literal: true
# Object#define_singleton_method
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#define_singleton_method"
# o001 = Object.new; o001.define_singleton_method(:dsm001) { 42 }; p o001.dsm001
# r001 = (Object.new.define_singleton_method(:dsm002) { 1 } rescue $!.class); p r001
