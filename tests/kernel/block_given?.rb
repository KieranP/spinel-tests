# frozen_string_literal: true
# Kernel#block_given?
def bg371; block_given?; end
p(bg371)
p(bg371 { 1 })
v371 = bg371 { 1 }; p v371

# block_given? with an explicit &block parameter, and inside a nested block
def bg372(&b372); block_given?; end
p(bg372)
p(bg372 { 1 })
v372 = bg372 { 1 }; p v372
def bg373; [1].map { block_given? }; end
p(bg373)
p(bg373 { 1 })
v373 = bg373 { 1 }; p v373
def bg374; block_given? ? yield : :none; end
p(bg374)
p(bg374 { :yielded })
v374 = bg374 { :yielded }; p v374
