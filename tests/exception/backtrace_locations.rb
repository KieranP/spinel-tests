# frozen_string_literal: true
# Exception#backtrace_locations
# WONTFIX: See docs/limitations.md - "Partial / relaxable limits — Exception#backtrace / Kernel#caller"
# b001 = (begin; raise "x"; rescue => e001; e001.backtrace_locations; end); p b001

# Placeholder so the file is valid Ruby and runs under both interpreters.
begin; raise "x"; rescue => e002; p e002.class; end
