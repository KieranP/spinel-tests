# frozen_string_literal: true
class BO < BasicObject
  def initialize
    @x = 1
  end
  def own
    @x
  end
end

# BasicObject blank slate
# BasicObject does not include Kernel, so a subclass instance responds ONLY to the
# eight BasicObject methods plus what it defines. Every Object/Kernel method raises
# NoMethodError. These compile under Spinel and are rescue-wrapped runtime probes
# (Ruby prints NoMethodError for each). Most now match; the residual divergences are tagged.
a001 = BO.new; r001 = (a001.class rescue $!.class); p r001
a002 = BO.new; r002 = (a002.inspect.class rescue $!.class); p r002
a003 = BO.new; r003 = (a003.to_s.class rescue $!.class); p r003
a004 = BO.new; r004 = (a004.nil? rescue $!.class); p r004
a005 = BO.new; r005 = (a005.object_id.class rescue $!.class); p r005
a006 = BO.new; r006 = (a006.respond_to?(:own) rescue $!.class); p r006
a007 = BO.new; r007 = (a007.is_a?(Object) rescue $!.class); p r007
a008 = BO.new; r008 = (a008.frozen? rescue $!.class); p r008
a009 = BO.new; r009 = (a009.send(:own) rescue $!.class); p r009
a010 = BO.new; r010 = (a010.instance_variable_get(:@x) rescue $!.class); p r010
a012 = BO.new; r012 = (a012.itself.equal?(a012) rescue $!.class); p r012

# For contrast, the methods a BasicObject subclass DOES have all work (no rescue):
a013 = BO.new; p(a013.own)
a014 = BO.new; p(a014.equal?(a014))
a015 = BO.new; p(a015.__send__(:own))

# `a.dup` raises NoMethodError (BasicObject has no #dup); chained before a user method
# in a rescue modifier, it is now caught correctly.
a011 = BO.new; r011 = (a011.dup.own rescue $!.class); p r011
