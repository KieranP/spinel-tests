# frozen_string_literal: true
# Float#__id__ (alias of #object_id — raw value is impl-defined, so test structurally)
p(3.5.__id__.is_a?(Integer))
a001 = 3.5; p(a001.__id__ == a001.__id__)
a002 = 3.5; v002 = (a002.__id__.is_a?(Integer)); p v002
