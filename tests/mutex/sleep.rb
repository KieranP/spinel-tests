# frozen_string_literal: true
# Mutex#sleep
# Mutex#sleep is not listed in docs/thread.md's Supported API (the Mutex row lists
# only lock/unlock/try_lock/locked?/owned?). Spinel cleanly rejects it at the front
# end ("unsupported call") without emitting C, so it is documented-by-omission.
# WONTFIX: not in docs/thread.md Supported API
# m001 = Mutex.new; m001.lock; r001 = m001.sleep(0.01); p r001.class; m001.unlock
