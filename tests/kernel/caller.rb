# frozen_string_literal: true
# Kernel#caller
def f481; caller; end
p(f481.is_a?(Array))
v481 = f481; p(v481.is_a?(Array))
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# p(f481)

# Kernel#caller_locations (same backtrace-frame limitation)
def g482; caller_locations; end
p(g482.is_a?(Array))
v482 = g482; p(v482.is_a?(Array))
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# p(g482)
