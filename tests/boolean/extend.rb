# frozen_string_literal: true
# TrueClass#extend / FalseClass#extend
# WONTFIX: See docs/limitations.md - "Fundamental limits — Object#extend(mod)"
# module M001; end
# p(true.extend(M001).equal?(true))     # Ruby true; Spinel: unsupported (front-end reject)
# p(false.extend(M001).equal?(false))   # Ruby true; Spinel: unsupported (front-end reject)
