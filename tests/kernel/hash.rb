# frozen_string_literal: true
# Kernel#hash
p(Object.new.hash.is_a?(Integer))
a022 = Object.new; p(a022.hash == a022.hash)
a023 = Object.new; v023 = (a023.hash.is_a?(Integer)); p v023

# Kernel#Hash
# (this file also covers Kernel#Hash — the case-insensitive filesystem folds
#  Hash.rb into hash.rb, so both methods share it, each with its own header.)
p(Hash(nil))
c411 = Hash(nil); p(c411)
p(Hash([]))
c412 = Hash({ a: 1 }); p(c412)
r417 = (Hash({}) rescue $!.class); p r417
h418 = {}; p(Hash(h418))
c413 = Hash([]); p(c413)
r414 = (Hash([[1, 2]]) rescue $!.class); p r414
r415 = (Hash(1) rescue $!.class); p r415

# a #to_hash object is not consulted
class ToHash416; def to_hash; { z: 9 }; end; end
r416 = (Hash(ToHash416.new) rescue $!.class); p r416
