# frozen_string_literal: true
# Object#singleton_methods
# WONTFIX: See docs/limitations.md - "Fundamental limits — General reflection (methods, instance_variables)"
# o = Object.new; def o.foo; 1; end; p o.singleton_methods   # Ruby: [:foo]; Spinel: unsupported
