# frozen_string_literal: true
# Object#respond_to_missing?
# WONTFIX: See docs/limitations.md - "Fundamental limits — method_missing"
# class C195; def respond_to_missing?(n, i = false); n == :ghost; end; end
# p(C195.new.respond_to?(:ghost))   # Ruby: true; Spinel: false
