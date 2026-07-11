# frozen_string_literal: true

require 'minitest/autorun'

$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'spinel_check'

# No global colour switch needed: Style binds to the stream it writes to, and a StringIO
# under test is not a tty.
