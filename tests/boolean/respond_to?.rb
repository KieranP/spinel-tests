# frozen_string_literal: true
# TrueClass#respond_to?
p(true.respond_to?(:&))
p(true.respond_to?(:definitely_not_a_method_xyz))
a020 = true; p(a020.respond_to?(:&))
a021 = true; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021

# two-arg form (include_all) and more method names
p(true.respond_to?(:&, true))
p(true.respond_to?(:|))
p(true.respond_to?(:to_s))
p(true.respond_to?(:!))
a022 = true; v022 = a022.respond_to?(:^, false); p v022

# FalseClass#respond_to?
p(false.respond_to?(:&))
p(false.respond_to?(:definitely_not_a_method_xyz))
a065 = false; p(a065.respond_to?(:&))
a066 = false; v066 = a066.respond_to?(:definitely_not_a_method_xyz); p v066
p(false.respond_to?(:===, true))
a067 = false; v067 = a067.respond_to?(:to_s); p v067
