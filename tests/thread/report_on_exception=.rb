# frozen_string_literal: true
# Thread#report_on_exception=
t001 = Thread.new { 1 }
t001.report_on_exception = false
t001.join
p t001.report_on_exception
t002 = Thread.new { 1 }
v001 = (t002.report_on_exception = true)
t002.join
p v001
# t003 = Thread.new { 1 }; t003.abort_on_exception = true; t003.join   # WONTFIX: not in docs/thread.md Supported API
