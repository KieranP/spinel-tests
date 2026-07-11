# frozen_string_literal: true
# Hash#compare_by_identity
# WONTFIX: See docs/limitations.md - "By design — Hash#compare_by_identity"
# p({}.compare_by_identity)
# WONTFIX: See docs/limitations.md - "By design — Hash#compare_by_identity"
# a325 = {}; a325.compare_by_identity; a325["x"] = 1; a325["x"] = 2; p(a325.size)
# WONTFIX: See docs/limitations.md - "By design — Hash#compare_by_identity"
# a326 = {}; c326 = (a326.compare_by_identity); c326["y"] = 1; c326["y"] = 2; p(c326.size)
