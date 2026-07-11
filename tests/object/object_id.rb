# frozen_string_literal: true
class Obj195
end

# Object#object_id
p(Obj195.new.object_id.is_a?(Integer))
a024 = Obj195.new; p(a024.object_id == a024.object_id)
a025 = Obj195.new; v025 = (a025.object_id.is_a?(Integer)); p v025
p(5.object_id == 5.object_id)
p(nil.object_id)
p(true.object_id)
p(false.object_id)
p(:a.object_id == :a.object_id)
b024 = Obj195.new; c024 = Obj195.new; p(b024.object_id == c024.object_id)
