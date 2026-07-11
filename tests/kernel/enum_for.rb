# frozen_string_literal: true
# Kernel#enum_for
e030 = [1, 2, 3].enum_for(:each)
p(e030.next)
p(e030.next)
v030 = [10, 20].enum_for(:each).next; p v030
p([4, 5, 6].enum_for(:each).to_a)
# enum_for over an arbitrary user method (not Array/Range#each) is an external Enumerator:
# 3.enum_for(:times).next    # WONTFIX: See docs/limitations.md - "Partial / relaxable limits — External Enumerator"
