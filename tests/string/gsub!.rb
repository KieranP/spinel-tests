# frozen_string_literal: true
# String#gsub!
p((+"hello").gsub!("l", "L"))
a065 = +"hello"; a065.gsub!("l", "L"); p a065
a066 = +"hello"; b066 = +"L"; a066.gsub!("l", b066); p a066
a067 = +"hello"; b067 = +"L"; c067 = (a067.gsub!("l", b067)); p c067
# no-match returns nil (no change)
p((+"hello").gsub!("x", "y"))
a068 = +"hello"; c068 = (a068.gsub!("x", "y")); p c068

# the return value as nil
a950 = +"abc"; v950 = a950.gsub!("b", "*"); p [a950, v950]
b951 = +"abc"; w951 = b951.gsub!("b", "*"); r951 = [b951, w951]; p r951
