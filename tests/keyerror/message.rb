# frozen_string_literal: true
# KeyError#message
p(KeyError.new("boom").message)
m001 = KeyError.new("boom").message; p m001

# default message is the class name
p(KeyError.new.message)
m002 = KeyError.new.message; p m002

# explicit nil argument falls back to the class name
p(KeyError.new(nil).message)
m003 = KeyError.new(nil).message; p m003

# message and to_s agree
a004 = KeyError.new("z"); p(a004.message == a004.to_s)
r004 = (a004.message == a004.to_s); p r004

# a naturally-raised KeyError carries a non-empty String message that names the key
p(begin; {a: 1}.fetch(:zzz); rescue KeyError => e005; e005.message.class; end)
p(begin; {a: 1}.fetch(:zzz); rescue KeyError => e006; e006.message.length > 0; end)
r007 = (begin; {a: 1}.fetch(:zzz); rescue KeyError => e007; e007.message.include?("zzz"); end); p r007

# a Symbol-keyed hash renders the key with a leading colon in the message
begin; {a: 1}.fetch(:zzz); rescue KeyError => e008; p e008.message; end

# raising the class alone uses the default (class name) message
p(begin; raise KeyError; rescue => e009; e009.message; end)
