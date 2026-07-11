# frozen_string_literal: true
# Kernel#require
p(require('stringio'))
r801 = require('stringio'); p r801
p(require('stringio'))
p(require('set').inspect)
r802 = [require('strscan')]; p r802

if require('pathname') then puts 'loaded' else puts 'already' end
r803 = ((require('pathname')) ? :truthy : :falsy); p r803
p(require('pathname').class)
r804 = require('pathname').class; p r804

require 'rational'
p(Rational(1, 2) + Rational(1, 3))
r805 = Rational(1, 2) + Rational(1, 3); p r805
