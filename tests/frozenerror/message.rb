# frozen_string_literal: true
# FrozenError#message
p(FrozenError.new("boom").message)
m001 = FrozenError.new("boom").message; p m001

# default message is the class name
p(FrozenError.new.message)
m002 = FrozenError.new.message; p m002

# explicit nil argument falls back to the class name
p(FrozenError.new(nil).message)
m003 = FrozenError.new(nil).message; p m003

# message and to_s agree
a004 = FrozenError.new("z"); p(a004.message == a004.to_s)
r004 = (a004.message == a004.to_s); p r004

# a naturally-raised frozen error carries a non-empty String message
p(begin; "s".freeze << "x"; rescue FrozenError => e005; e005.message.class; end)
p(begin; "s".freeze << "x"; rescue FrozenError => e006; e006.message.length > 0; end)
r007 = (begin; "s".freeze << "x"; rescue FrozenError => e007; e007.message.include?("frozen"); end); p r007

# raising the class alone uses the default (class name) message
p(begin; raise FrozenError; rescue => e008; e008.message; end)
