# frozen_string_literal: true
# NameError#receiver
# a no-receiver undefined-method NameError records the receiver (works)
o001 = Object.new; begin; o001.nope123; rescue NameError => e001; p e001.receiver.class; end
# The error itself is raised and rescued correctly:
o002 = Object.new
begin; o002.nope123; rescue NameError => e002; p e002.class; end
# a NameError raised by const_get should record the module as its receiver
begin; Object.const_get(:MissingConstH); rescue NameError => e003; p e003.receiver; end
r004 = (begin; Object.const_get(:MissingConstH); rescue NameError => e004; e004.receiver; end); p r004
# a NameError built without a receiver raises ArgumentError from #receiver
r005 = (NameError.new("m", :n).receiver rescue $!.class); p r005
