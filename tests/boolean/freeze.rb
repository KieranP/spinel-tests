# frozen_string_literal: true
# TrueClass#freeze
a039 = true; a039.freeze; p(a039.frozen?)
a040 = true; v040 = a040.freeze; p(v040.frozen?)

# FalseClass#freeze
a084 = false; a084.freeze; p(a084.frozen?)
a085 = false; v085 = a085.freeze; p(v085.frozen?)
