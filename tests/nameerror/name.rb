# frozen_string_literal: true
# NameError#name
# explicit constructor records the name (works)
p(NameError.new("m", :bar).name)
n001 = NameError.new("m", :bar).name; p n001
# a no-receiver undefined-method NameError records the method name
o002 = Object.new
begin; o002.nope123; rescue NameError => e002; p e002.name; end
# a NameError raised by const_get should record the missing constant's name
begin; Object.const_get(:MissingConstG); rescue NameError => e003; p e003.name; end
n004 = (begin; Object.const_get(:MissingConstG); rescue NameError => e004; e004.name; end); p n004
# a NameError from an undefined bareword local/method records its name (compiles now; Spinel's name is nil)
def undef_ref_m005; some_undefined_local_x005; end
n005 = (undef_ref_m005 rescue $!.name); p n005

# an undefined bare identifier inside a method raises NameError naming it
def m005; nosuchthing005; end
r005 = (begin; m005; rescue NameError => e005; e005.name; end); p r005
p(begin; m005; rescue NameError => e006; e006.class.to_s; end)

# an undefined constant: the handler's value must not be a String (kept commented)
r007 = (begin; NoSuchConstant007; rescue NameError => e007; e007.class.to_s; end); p r007
r008 = (begin; NoSuchConstant008; rescue NameError => e008; e008.class; end); p r008

r009 = (begin; NoSuchConstant009; rescue NameError => e009; e009.name; end); p r009
p(begin; NoSuchConstant010; rescue NameError => e010; e010.class.to_s; end)
