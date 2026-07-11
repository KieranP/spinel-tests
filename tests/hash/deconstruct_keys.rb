# frozen_string_literal: true
# Hash#deconstruct_keys
a221 = { name: "x", age: 3 }
case a221
in { name: String => n221, age: Integer => g221 }
  p [n221, g221]
end
p({ name: "x", age: 3 }.deconstruct_keys([:name]))
b221 = { name: "x", age: 3 }; c221 = (b221.deconstruct_keys([:name])); p c221
d221 = { name: "x", age: 3 }; p(d221.deconstruct_keys(nil))

def pm593(v593)
  case v593
  in [x593, y593] then "array #{x593},#{y593}"
  in { r: r593 } then "hash r=#{r593}"
  else "other"
  end
end
p pm593([3, 4])
p pm593({ r: 10 })

def pm161(v161)
  case v161
  in [x161, y161] then "array #{x161},#{y161}"
  in { r: r161 } then "hash #{r161}"
  else "other"
  end
end
p pm161([3, 4])
p pm161({ a161: 1, r: 10 })

def desc040(e)
  case e
  in { type: :move, dx:, dy: } if dx == 0 && dy == 0 then "no movement"
  in { type: :move, dx:, dy: } then "move"
  in { type: :stop } | { type: :halt } then "stopping"
  else "unknown"
  end
end
puts desc040({ type: :move, dx: 0, dy: 0 })
