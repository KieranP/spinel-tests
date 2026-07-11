# frozen_string_literal: true
# String#sub!
p((+"hello").sub!("h", "H"))
a132 = +"hello"; a132.sub!("h", "H"); p a132
a133 = +"hello"; b133 = +"H"; a133.sub!("h", b133); p a133
a134 = +"hello"; b134 = +"H"; c134 = (a134.sub!("h", b134)); p c134
# the receiver read out of a Hash: the mutation lands but the return value is wrong
z016 = { a: +"abc" }; a016 = z016[:a]; a016.sub!("b", "*"); p z016
# was read out of a Hash
z017 = { a: +"abc" }; a017 = z017[:a]; v017 = a017.sub!("b", "*"); p [z017, v017]
z018 = { a: +"abc" }; a018 = z018[:a]; p a018.sub!("b", "*")
