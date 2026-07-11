# frozen_string_literal: true
# LocalJumpError#class / class ancestry
def m001; yield; end
begin; m001; rescue LocalJumpError => e001; p e001.class; end
begin; m001; rescue LocalJumpError => e002; k002 = e002.class; p k002; end

# a break-raised instance is also a LocalJumpError
begin; proc { break }.call; rescue LocalJumpError => e003; p e003.class; end

# class relationships (all agree)
p LocalJumpError.superclass
p(LocalJumpError < StandardError)
p(LocalJumpError < Exception)
p LocalJumpError.ancestors.include?(StandardError)
p LocalJumpError.ancestors.include?(Exception)
k004 = LocalJumpError.superclass; p k004
