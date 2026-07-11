# frozen_string_literal: true
# Recursive-descent JSON parser: String -> nested Ruby.
# Inference: value() returns a union (Hash / Array / String / Integer / Float /
# true / false / nil) that must be threaded through the whole recursive grammar.

class JSONParser
  def initialize(src)
    @src = src
    @pos = 0
  end

  def parse
    skip_ws
    value
  end

  def value
    skip_ws
    ch = @src[@pos]
    case ch
    when "{" then object
    when "[" then array
    when "\"" then string
    when "t" then @pos += 4; true
    when "f" then @pos += 5; false
    when "n" then @pos += 4; nil
    else number
    end
  end

  def object
    @pos += 1
    result = {}
    skip_ws
    if @src[@pos] == "}"
      @pos += 1
      return result
    end
    loop do
      skip_ws
      k = string
      skip_ws
      @pos += 1 # ':'
      result[k] = value
      skip_ws
      break unless @src[@pos] == ","
      @pos += 1
    end
    @pos += 1
    result
  end

  def array
    @pos += 1
    result = []
    skip_ws
    if @src[@pos] == "]"
      @pos += 1
      return result
    end
    loop do
      result << value
      skip_ws
      break unless @src[@pos] == ","
      @pos += 1
    end
    @pos += 1
    result
  end

  def string
    @pos += 1
    start = @pos
    @pos += 1 until @src[@pos] == "\""
    s = @src[start...@pos]
    @pos += 1
    s
  end

  def number
    start = @pos
    @pos += 1 while @pos < @src.length && "-+0123456789.eE".include?(@src[@pos])
    tok = @src[start...@pos]
    tok.include?(".") ? tok.to_f : tok.to_i
  end

  def skip_ws
    @pos += 1 while @pos < @src.length && " \t\n".include?(@src[@pos])
  end
end

doc = '{"name": "spinel", "nums": [1, 2, 3], "meta": {"ok": true, "ratio": 1.5, "x": null}}'
parsed = JSONParser.new(doc).parse

p parsed["name"]
p parsed["nums"]
p parsed["nums"].sum
p parsed["meta"]["ok"]
p parsed["meta"]["ratio"]
p parsed["meta"]["x"]
