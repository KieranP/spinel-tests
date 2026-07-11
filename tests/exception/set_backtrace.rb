# frozen_string_literal: true
# Exception#set_backtrace
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# e001 = RuntimeError.new("m"); e001.set_backtrace(["a.rb:1"]); p e001.backtrace

# Placeholder so the file is valid Ruby and runs under both interpreters.
p(RuntimeError.new("m").message)
