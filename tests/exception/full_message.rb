# frozen_string_literal: true
# Exception#full_message
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
begin; raise "x"; rescue => e001; p e001.full_message.class; end
f002 = (begin; raise "x"; rescue => e002; e002.full_message; end); p f002.class

# the highlight:/order: keywords are accepted and still return a String
begin; raise "x"; rescue => e003; p e003.full_message(highlight: false, order: :bottom).class; end
f004 = (begin; raise "x"; rescue => e004; e004.full_message(highlight: false, order: :top); end); p f004.class

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# begin; raise "x"; rescue => e005; puts e005.full_message; end

# #full_message on an instance of a user-defined subclass (kept commented: the
# call is refused at compile time, which aborts the file)
class FmSub006 < StandardError; end
p(FmSub006.new("m").full_message.class)
f006 = FmSub006.new("m").full_message; p f006.class
