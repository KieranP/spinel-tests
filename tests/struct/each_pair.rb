# frozen_string_literal: true
Point = Struct.new(:x, :y)

# Struct#each_pair
Coll141 = Struct.new(:x, :y)
Coll141.new(1, 2).each_pair { |k, v| print "#{k}=#{v} " }; puts
v017 = Coll141.new(1, 2).each_pair { |k, v| print "#{k}=#{v} " }; p(v017)
# receiver in a variable; the block's return value is the receiver
e018 = Coll141.new(3, 4); e018.each_pair { |k, v| print "#{k}:#{v} " }; puts
e019 = Coll141.new(3, 4); p(e019.each_pair { |_k, _v| }.equal?(e019))
# a single-parameter block receives the [name, value] pair; Spinel hands it only
# the member name. Runtime value difference, so these stay live.
Coll142 = Struct.new(:a, :b, :c)
Coll142.new(1, "s", [2]).each_pair { |pair| p pair }
v019 = []; Coll142.new(1, "s", [2]).each_pair { |pair| v019 << pair }; p(v019)
v020 = []; Coll142.new(1, "s", [2]).each_pair { |k, v| v020 << [k, v] }; p(v020)

# With no block CRuby returns an Enumerator; Spinel raises LocalJumpError.
# Runtime error, so these stay live.
r021 = (Coll142.new(1, 2, 3).each_pair.to_a rescue $!.class); p r021
r022 = (Coll141.new(1, 2).each_pair.map { |k, v| "#{k}#{v}" } rescue $!.class); p r022
r023 = (Coll141.new(1, 2).each_pair.first rescue $!.class); p r023
