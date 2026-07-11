# frozen_string_literal: true
# Regexp.union
p(Regexp.union("a", "b", "c"))
p(Regexp.union(["a", "b"]))
p(Regexp.union("a", "b").source)
p(Regexp.union("a", "b").match?("b"))
a001 = Regexp.union("x", "y"); p(a001.match("y")[0])
a002 = Regexp.union("x", "y"); v002 = a002.source; p v002

# Regexp arguments: Ruby wraps each operand in its inline-option group, Spinel omits it
p(Regexp.union(/a/, /b/))

# Array of alternatives held in a variable
a003 = ["x", "y"]; p(Regexp.union(a003))

# No operands, an empty Array, and a single operand
p(Regexp.union)
p(Regexp.union([]))
p(Regexp.union("a"))
p(Regexp.union(/a/))
a004 = []; v004 = Regexp.union(a004); p v004

# Metacharacters in a String operand are escaped, in a Regexp operand are not
p(Regexp.union("a.b", "c"))
p(Regexp.union("a.b").match?("axb"))
p(Regexp.union(/a.b/).match?("axb"))
a005 = ["a", /b/]; v005 = Regexp.union(a005); p v005

# The union matches any alternative
p(Regexp.union("cat", "dog").match("hotdog")[0])
a006 = Regexp.union("cat", "dog"); v006 = a006.match("cat")[0]; p v006
