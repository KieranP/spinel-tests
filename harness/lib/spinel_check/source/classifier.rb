# frozen_string_literal: true

require 'prism'

module SpinelCheck
  module Source
    # Is this comment body a line of CODE (safe to uncomment) or PROSE?
    #
    # Every pattern is ANCHORED to the start of the stripped line, and that anchoring is
    # load-bearing. An unanchored keyword like /\brescue\b/ was the cause of botched
    # activations: prose such as "…a rescue can't catch a compile error…" contains the word
    # and was uncommented as if it were code. Real code lines BEGIN with these tokens;
    # prose continuations of a `# BUG …` header do not.
    #
    # Callers additionally parse-check the result before writing or running it, so this is
    # the first of two guards, not the only one.
    module Classifier
      # What may legally follow a bare keyword in real code: whitespace, an argument list, a
      # closing paren, a separator, a method chain, or end of line.
      #
      # `\b` was too weak. It let `raise/rescue at all, compile clean.` — prose from a bug
      # report — match as a `raise` statement, because a word boundary sits between `raise`
      # and `/`. The characters left out are the ones that join a keyword into a WORD or a
      # sentence (`/`, `-`, `'`, `:`, `?`), which is prose; the ones kept all appear in real
      # code, and `)` in particular is load-bearing — `end); p r009` is the tail of a
      # multi-line `r009 = (begin … end); p r009` form, and treating it as prose would leave
      # it commented and silently break the form.
      ARGUMENT_FOLLOWS = /(?=[\s(),.;]|\z)/

      # `p x`, `puts …` — the probe lines a test file is mostly made of.
      PRINT = /\A(?:p|pp|puts|print)#{ARGUMENT_FOLLOWS}/

      # Statement keywords and the common declaration DSL. `attr` matches with or WITHOUT
      # the _reader/_accessor/_writer suffix — bare `attr :x` is real code, and leaving it
      # commented left an activated reader undefined, i.e. a false NoMethodError.
      KEYWORD = /\A(?:begin|rescue|ensure|else|elsif|end|def|class|module|return|yield|next|break|
                     raise|require|loop|include|extend|attr(?:_(?:reader|accessor|writer))?|
                     private|public|protected)#{ARGUMENT_FOLLOWS}/x

      # Assignment: `x = …`, `x ||= …`, `a[i] = …`, `@x = …` — but NOT ==, =~, =>.
      ASSIGNMENT = %r{\A@{0,2}\w[\w.]*(?:\[[^\]]*\])?\s*(?:\|\||&&|<<|>>|\*\*|[-+*/%|&^])?=(?![=~>])}

      # Multiple assignment: `a, b = …`, `k, v = pair`, `a, *rest = …`, `x, y[i] = …`.
      # Without this the multi-assign line stayed COMMENTED while a dependent line
      # (`p [a, b]`) was uncommented — parseable Ruby that fails at runtime on an undefined
      # local, which a syntax check cannot catch.
      MULTIPLE_ASSIGNMENT = /\A\(?\*?@{0,2}\w[\w.]*(?:\[[^\]]*\])?\s*,[\w\s.,@()\[\]*]*=(?![=~>])/

      # A named receiver sending a message or appending: `recv.meth …`, `Foo::bar`,
      # `foo(…)`, `arr << x`, `obj.each { … }`. This was the gap that silently dropped
      # lines like `tbl.each { |a, b| out += b }`.
      #
      # `(` must FOLLOW the receiver with NO space: `foo(x)` is a call, but prose like
      # `rejected ("unsupported …")` (word, space, paren) is not — it was being uncommented
      # into a bogus CallNode. `<<` and `{` keep their optional space.
      MESSAGE_SEND = /\A@{0,2}\w[\w.]*(?:\[[^\]]*\])?(?:\.\w|::\w|\(|\s*(?:<<|\{))/

      # A LITERAL receiver sending a message: `[[1, 2]].each { … }`, `"ab".chars`,
      # `1.upto(3)`, `{a: 1}.fetch(:a)`, `(1..3).to_a`, `%w[a b].map { … }`. Every pattern
      # above needs a NAME first, so a form whose receiver is a literal was never
      # recognised — meaning verify and activate left it commented and the report read as
      # clean on a line that still failed.
      # A bare container literal standing alone on the line — `[{}, layout, 0]`, `{ a: 1 }`.
      # Every other rule needs a name, a keyword or a message send, so a method body whose
      # last line is the literal it RETURNS was judged prose: activation left that one line
      # commented, the method silently returned something else, and the run diverged on a
      # value the activation had invented rather than on anything Spinel did. Prism decides
      # it, because the shape alone is not enough — bracketed prose (`[section] — [sub]`)
      # matches the regex but does not parse as a literal.
      BARE_LITERAL_SHAPE = /\A(?:\[.*\]|\{.*\})\z/

      # A lambda literal opening the line: `->(step) { … }`, `-> { … }`, `lambda do |x|`,
      # `proc { … }`. Every other rule needs a name, a keyword or a literal receiver, so the
      # BODY of a commented-out lambda-returning method read as prose — activation
      # uncommented the `def` and `end` around it, left the body commented, and the empty
      # method then returned nil, failing on something the report had nothing to do with.
      LAMBDA = /\A(?:->|(?:lambda|proc)\s*(?:do\b|\{))/

      LITERAL_RECEIVER = /\A(?:\[|\{|"|'|:\w|%[wiWI]?[\[({]|\(|-?\d)/
      SENDS_MESSAGE    = /\.\w|\s<</
      # Prose guard: a real code line does not end in sentence punctuation.
      SENTENCE_TAIL    = /[.;:,]\z/

      module_function

      # A probe line — something that produces output rather than sets something up.
      def print?(body) = body.lstrip.match?(PRINT)

      # One container literal and nothing else — not a literal receiving a message, which
      # MESSAGE_SEND / LITERAL_RECEIVER already cover.
      def bare_literal?(line)
        return false unless line.match?(BARE_LITERAL_SHAPE)

        result = Prism.parse(line)
        return false unless result.success?

        statements = result.value.statements.body
        statements.size == 1 && [Prism::ArrayNode, Prism::HashNode].any? { |k| k === statements.first }
      end

      def code?(body)
        line = body.strip
        return true if line.match?(PRINT)
        return true if line.match?(KEYWORD)
        return true if line.match?(ASSIGNMENT)
        return true if line.match?(MULTIPLE_ASSIGNMENT)
        return true if line.match?(MESSAGE_SEND)
        return true if line.match?(LAMBDA)

        return true if bare_literal?(line)

        line.match?(LITERAL_RECEIVER) && line.match?(SENDS_MESSAGE) && !line.match?(SENTENCE_TAIL)
      end
    end
  end
end
