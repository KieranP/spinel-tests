# frozen_string_literal: true
# String#replace
p((+"old").replace("new"))
a094 = +"old"; a094.replace("new"); p a094
a095 = +"old"; b095 = +"new"; a095.replace(b095); p a095
a096 = +"old"; b096 = +"new"; c096 = (a096.replace(b096)); p c096
# replace on it leaves the Array untouched
z014 = [+"abc"]; a014 = z014.first; a014.replace(+"zzz"); p z014
z015 = [+"abc"]; a015 = z015.first; v015 = a015.replace(+"zzz"); p [z015, v015]
