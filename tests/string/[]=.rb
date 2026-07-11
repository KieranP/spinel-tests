# frozen_string_literal: true
# String#[]=
a001 = +"hello"; a001[0] = +"H"; p a001
a002 = +"hello"; a002[-1] = +"O"; p a002
a003 = +"hello"; a003[1, 2] = +"X"; p a003
a004 = +"hello"; a004[1..3] = +"XY"; p a004
a005 = +"hello"; a005[/l+/] = +"L"; p a005
a006 = +"hello"; a006["ell"] = +"ELL"; p a006
# inserting more than one character grows the string
a007 = +"hello"; a007[0] = +"HE"; p a007
# assignment with a variable rhs
a008 = +"hello"; b008 = +"J"; a008[0] = b008; p a008
# []= on a frozen string raises FrozenError
a009 = "hi".freeze; begin; a009[0] = +"H"; p :nope; rescue FrozenError => e; p e.class; end
# the value of an element assignment is its right-hand side, whether captured in a
# variable or passed straight to p
a010 = +"hi"; v010 = (a010[0] = +"Y"); p v010
a011 = +"hi"; p(a011[0] = +"Y")

def poison012(start012); path012 = [start012]; mut012(path012.last); end
def mut012(word012); word012[0] = +"z"; word012; end
p mut012("hot".dup)
r012 = mut012("cat".dup); p r012
z001 = +"hello"; begin; z001[/(l)(o)/, 2] = +"O"; rescue => e001; p e001.class; end; p z001
# endless / beginless Range targets, and a zero-length span (insertion)
z002 = +"hello"; z002[1..] = +"EY"; p z002
z003 = +"hello"; begin; z003[..1] = +"HE"; rescue => e003; p e003.class; end; p z003
z009 = +"hello"; begin; z009[...2] = +"HE"; rescue => e009; p e009.class; end; p z009
z004 = +"hello"; z004[1, 0] = +"-"; p z004
z005 = +"hello"; v005 = (z005[1, 0] = +"-"); p v005
# a Regexp that does not match raises IndexError
z006 = +"hello"; r006 = (begin; z006[/z/] = +"X"; :nope; rescue IndexError => e006; e006.class; end); p r006
# a String that does not occur raises IndexError
z007 = +"hello"; r007 = (begin; z007["zz"] = +"X"; :nope; rescue IndexError => e007; e007.class; end); p r007
# an out-of-range Integer index raises IndexError
z008 = +"hello"; r008 = (begin; z008[10] = +"X"; :nope; rescue IndexError => e008; e008.class; end); p r008
# []= through a container read
z009 = [+"abc", +"def"]; r009 = (begin; z009[0][1] = +"*"; z009; rescue NoMethodError => e009; e009.class; end); p r009
z010 = { a: +"abc" }; r010 = (begin; z010[:a][1] = +"*"; z010; rescue NoMethodError => e010; e010.class; end); p r010
z011 = [+"abc"]; r011 = (begin; z011.first[1] = +"*"; z011; rescue NoMethodError => e011; e011.class; end); p r011

# binding it to a local first makes the assignment a silent no-op
z950 = ["ab", "cd"].map(&:dup); r950 = (begin; z950[0][1] = +"*"; z950; rescue NoMethodError => e950; e950.class; end); p r950
z951 = ["ab", "cd"].map(&:dup); v951 = (begin; z951[0][1] = +"*"; z951; rescue NoMethodError => e951; e951.class; end); p v951
z952 = ["ab", "cd"].map(&:dup); s952 = z952[0]; s952[1] = +"*"; p z952
z953 = ["ab", "cd"].map(&:dup); v953 = z953[0].respond_to?(:[]=); p v953

z960 = +"abc"; p960 = [[0, 1]]; p960.each { |r960, c960| z960[c960] = +"*" }; p z960
z961 = +"abc"; p961 = [[0, 1]]; v961 = p961.each { |r961, c961| z961[c961] = +"*" }; p z961

# write when the String is reached through a container subscript
z962 = ["abc", "def"].map(&:dup); p962 = [[0, 1]]; p962.each { |r962, c962| z962[0][c962] = +"*" }; p z962
z963 = ["abc", "def"].map(&:dup); p963 = [[0, 1]]; v963 = p963.each { |r963, c963| z963[0][c963] = +"*" }; p z963

# and the block destructures two parameters
z970 = ["abc", "def"].map(&:dup); p970 = [[0, 1]]; p970.each { |r970, c970| z970[r970][c970] = +"*" }; p z970
z971 = ["abc", "def"].map(&:dup); p971 = [[0, 1]]; v971 = p971.each { |r971, c971| z971[r971][c971] = +"*" }; p z971
