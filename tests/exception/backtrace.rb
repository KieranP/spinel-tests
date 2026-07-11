# frozen_string_literal: true
# Exception#backtrace
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
begin; raise "x"; rescue => e001; p e001.backtrace.class; end
b002 = (begin; raise "x"; rescue => e002; e002.backtrace; end); p b002.class
begin; raise "x"; rescue => e003; b003 = e003.backtrace; p b003.is_a?(Array); end

# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# begin; raise "x"; rescue => e004; p e004.backtrace.empty?; end

# #backtrace on an instance of a user-defined subclass (kept commented: the call
# is refused at compile time, which aborts the file)
class BtSub006 < StandardError; end
p(BtSub006.new("m").backtrace)
b006 = BtSub006.new("m").backtrace; p b006
