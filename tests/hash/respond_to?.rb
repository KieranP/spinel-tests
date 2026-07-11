# frozen_string_literal: true
# Hash#respond_to?
p({ a: 1 }.respond_to?(:keys))
p({ a: 1 }.respond_to?(:definitely_not_a_method_xyz))
a020 = { a: 1 }; p(a020.respond_to?(:keys))
a021 = { a: 1 }; v021 = a021.respond_to?(:definitely_not_a_method_xyz); p v021

# other real Hash methods -> true
p({ a: 1 }.respond_to?(:values))
p({ a: 1 }.respond_to?(:size))
p({ a: 1 }.respond_to?(:each))
p({ a: 1 }.respond_to?(:map))
p({ a: 1 }.respond_to?(:to_a))

a022 = { a: 1 }; v022 = a022.respond_to?(:values); p v022
a023 = { a: 1 }; v023 = a023.respond_to?(:size); p v023
a024 = { a: 1 }; v024 = a024.respond_to?(:merge); p v024

# another bogus method -> false
p({ a: 1 }.respond_to?(:no_such_hash_method_qq))
a025 = { a: 1 }; v025 = a025.respond_to?(:no_such_hash_method_qq); p v025

# different receiver key/value types
p({ "x" => 1 }.respond_to?(:keys))
a026 = { 1 => "one" }; v026 = a026.respond_to?(:fetch); p v026

# empty-hash receiver
p({}.respond_to?(:keys))
a027 = {}; v027 = a027.respond_to?(:size); p v027
