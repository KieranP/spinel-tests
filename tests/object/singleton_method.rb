# frozen_string_literal: true
# Object#singleton_method
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# o001 = Object.new; def o001.foo001; 9; end; p o001.singleton_method(:foo001).call
# r001 = (Object.new.singleton_method(:hash) rescue $!.class); p r001
