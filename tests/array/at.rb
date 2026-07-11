# frozen_string_literal: true
# Array#at

p([10, 20, 30].at(1))

a001 = [10, 20, 30]
p a001.class
p(a001.at(1))

a002 = [10, 20, 30]
b002 = 1
p b002.class
p(a002.at(b002))

a003 = [10, 20, 30]
b003 = 1
c003 = (a003.at(b003))
p c003.class
p c003

p([1.1, 2.2, 3.3].at(-1))

a011 = [1.1, 2.2, 3.3]
p a011.class
p(a011.at(-1))

a012 = [1.1, 2.2, 3.3]
b012 = -1
p b012.class
p(a012.at(b012))

a013 = [1.1, 2.2, 3.3]
b013 = -1
c013 = (a013.at(b013))
p c013.class
p c013

p(["a", "b", "c"].at(0))

a021 = ["a", "b", "c"]
p a021.class
p(a021.at(0))

a022 = ["a", "b", "c"]
b022 = 0
p b022.class
p(a022.at(b022))

a023 = ["a", "b", "c"]
b023 = 0
c023 = (a023.at(b023))
p c023.class
p c023

# #at on an Array value read out of a {}-created Hash into a local.
ha377 = {}
ha377["a"] = [7, 8, 9]
ra377 = ha377["a"]
va377 = (ra377.at(0) rescue $!.class); p va377

# a String index aborts the C build
r421 = ([1, 2].at("x") rescue $!.class); p r421
# a non-Integer index is absorbed instead of raising TypeError
r402 = ([1, 2].at(:s) rescue $!.class); p r402
