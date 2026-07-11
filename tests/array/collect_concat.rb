# frozen_string_literal: true
# Array#collect_concat

p([1, 2, 3].collect_concat { |ni| [ni, -ni] })

a001 = [1, 2, 3]
p a001.class
p a001.collect_concat { |ni| [ni, -ni] }

a002 = [1, 2, 3]
c002 = a002.collect_concat { |ni| [ni, -ni] }
p c002.class
p c002

p([1.1, 2.2, 3.3].collect_concat { |nf| [nf, nf * 2] })

a003 = [1.1, 2.2, 3.3]
p a003.class
p a003.collect_concat { |nf| [nf, nf * 2] }

a004 = [1.1, 2.2, 3.3]
c004 = a004.collect_concat { |nf| [nf, nf * 2] }
p c004.class
p c004

p(["a", "b", "c"].collect_concat { |ns| [ns, ns] })

a005 = ["a", "b", "c"]
p a005.class
p a005.collect_concat { |ns| [ns, ns] }

a006 = ["a", "b", "c"]
c006 = a006.collect_concat { |ns| [ns, ns] }
p c006.class
p c006
