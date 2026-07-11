# frozen_string_literal: true
# Kernel#iterator?
def has_block001; block_given?; end
p(has_block001)
p(has_block001 { })
v001 = has_block001 { }; p v001

def has_iter001; iterator?; end
p(has_iter001)
p(has_iter001 { })
v002 = has_iter001 { }; p v002
