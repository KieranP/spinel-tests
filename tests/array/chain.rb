# frozen_string_literal: true
# Array#chain
p([1, 2, 3].chain.to_a)
p([1, 2].chain([3, 4]).to_a)

a001 = [1, 2]
p a001.class
p a001.chain([3, 4]).to_a

a002 = [1, 2]
c002 = a002.chain([3, 4]).to_a
p c002.class
p c002

# chained argument in a variable
a003 = [1, 2]
b003 = [3, 4]
p a003.chain(b003).to_a

a004 = [1, 2]
b004 = [3, 4]
c004 = a004.chain(b004).to_a
p c004

# multiple arguments
p([1].chain([2, 3], [4, 5]).to_a)

a005 = [1]
c005 = a005.chain([2, 3], [4, 5]).to_a
p c005

# floats
p([1.1].chain([2.2, 3.3]).to_a)

a006 = [1.1]
c006 = a006.chain([2.2, 3.3]).to_a
p c006

# strings
p(["a"].chain(["b", "c"]).to_a)

a007 = ["a"]
c007 = a007.chain(["b", "c"]).to_a
p c007

# chain with empty operand
p([1, 2].chain([]).to_a)
a008 = [1, 2]
c008 = a008.chain([]).to_a
p c008

# empty receiver chained (literal receiver works)
p([].chain([1, 2]).to_a)
# empty receiver held in a variable
a009 = []; c009 = a009.chain([1, 2]).to_a; p c009

# no arguments -> just the receiver's elements
a010 = [1, 2, 3]; c010 = a010.chain.to_a; p c010

# several arguments and empty operands
p([1, 2].chain([3, 4]).to_a)
w481 = [1, 2].chain([3, 4]).to_a; p w481
p([1, 2].chain([3], [4, 5]).to_a)
w482 = [1, 2].chain([3], [4, 5]).to_a; p w482
p([].chain([1]).to_a)
p([1].chain([]).to_a)
p(%w[a].chain(%w[b]).to_a)
w483 = %w[a].chain(%w[b]).to_a; p w483
