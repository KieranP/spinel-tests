# frozen_string_literal: true

require 'rainbow'

module SpinelCheck
  # Colour for the status column only.
  #
  # Bound to the stream it writes to, not to global state: colour follows whether THAT sink
  # is a terminal. Deciding it globally from `$stdout` meant a Reporter handed any other
  # sink — a file, a StringIO under test — still got escape codes written into it.
  #
  # Nothing but the leading status token is ever coloured, so the rest of a line is
  # unchanged either way and stays greppable.
  class Style
    COLOURS = {
      'MATCH' => :green, 'FIXED' => :green, 'OK' => :green,
      'DIFF' => :red, 'CERR' => :red, 'BROKEN' => :red, 'STILL-BROKEN' => :red,
      'WARN' => :yellow, 'PARTIAL' => :yellow, 'TIMEOUT' => :yellow, 'PARSE?' => :yellow,
      'MEMORY' => :magenta,
      'NO-TESTS' => :cyan
    }.freeze

    def initialize(io)
      @rainbow = Rainbow::Wrapper.new(io.tty? && ENV['NO_COLOR'].to_s.empty?)
    end

    # Colours a whole token by its leading segment, so 'DIFF+CERR' reads as one thing.
    #
    # Padding happens HERE, before the colour: escape sequences count toward String#length,
    # so a `%-9s` applied to an already-coloured token pads to the wrong width.
    def status(token, width: 0)
      padded = token.ljust(width)
      colour = COLOURS[token.split('+').first]
      colour ? @rainbow.wrap(padded).color(colour) : padded
    end

    def caution(text) = @rainbow.wrap(text).yellow
  end
end
