# instead of the elements
class DcArr140
  def deconstruct = [:x, :y]
end
case DcArr140.new
in [a140, b140] then p [a140, b140]
end
case DcArr140.new
in [a141, b141] then v141 = [a141, b141]; p v141
end
class DcArr142
  def deconstruct = ["s", 1]
end
case DcArr142.new
in [a142, b142] then p [a142, b142]
end
# calling deconstruct directly is correct
p DcArr140.new.deconstruct
