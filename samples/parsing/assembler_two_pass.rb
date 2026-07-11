# frozen_string_literal: true
# A two-pass assembler for a small accumulator machine: pass one resolves labels
# and directives to addresses, pass two encodes each instruction into a word, and
# the resulting image is disassembled and then executed to check it runs.
# Inference: source lines become a Struct with optional fields, the symbol table
# is Hash{String=>Integer} built in one pass and read in another, and the encoder
# returns Integers that the interpreter must decode back into opcode Symbols.

ISA = {
  "LDA" => 0x1, "STA" => 0x2, "ADD" => 0x3, "SUB" => 0x4,
  "JMP" => 0x5, "JZ"  => 0x6, "OUT" => 0x7, "HLT" => 0x0,
  "LDI" => 0x8
}.freeze

MNEMONIC = ISA.invert.freeze
NO_OPERAND = %w[OUT HLT].freeze

Line = Struct.new(:number, :label, :op, :operand, :directive) do
  def instruction? = !op.nil?
  def word? = directive == "WORD"
end

SOURCE = <<~ASM
  ; sum the values in TABLE until a zero sentinel, then print the total
        LDA   ZERO
        STA   TOTAL
        LDA   HEAD      ; HEAD holds the address of TABLE
        STA   PTR
  LOOP: LDI   PTR       ; acc = mem[mem[PTR]]
        JZ    DONE
        ADD   TOTAL
        STA   TOTAL
        LDA   PTR
        ADD   ONE
        STA   PTR
        JMP   LOOP
  DONE: LDA   TOTAL
        OUT
        HLT
  ZERO: WORD  0
  ONE:  WORD  1
  PTR:  WORD  0
  TOTAL:WORD  0
  HEAD: WORD  TABLE
  TABLE:WORD  7
        WORD  11
        WORD  5
        WORD  0
ASM

def parse(text)
  lines = []
  text.each_line.with_index(1) do |raw, number|
    body = raw.split(";").first.to_s.rstrip
    next if body.strip.empty?

    label = nil
    if body =~ /\A([A-Z_][A-Z0-9_]*):/
      label = Regexp.last_match(1)
      body = body.sub(/\A[A-Z_][A-Z0-9_]*:/, "")
    end
    parts = body.split
    if parts.empty?
      lines << Line.new(number, label, nil, nil, nil)
    elsif parts.first == "WORD"
      lines << Line.new(number, label, nil, parts[1], "WORD")
    else
      lines << Line.new(number, label, parts.first, parts[1], nil)
    end
  end
  lines
end

def first_pass(lines)
  symbols = {}
  address = 0
  layout = []
  lines.each do |line|
    symbols[line.label] = address unless line.label.nil?
    next unless line.instruction? || line.word?

    layout << [address, line]
    address += 1
  end
  [symbols, layout, address]
end

def resolve_operand(text, symbols, line_number)
  return 0 if text.nil?
  return text.to_i if text =~ /\A\d+\z/

  symbols.fetch(text) { raise ArgumentError, "undefined label #{text} on line #{line_number}" }
end

def encode(line, symbols)
  return resolve_operand(line.operand, symbols, line.number) & 0xFFF if line.word?

  opcode = ISA.fetch(line.op) { raise ArgumentError, "unknown op #{line.op} on line #{line.number}" }
  operand = resolve_operand(line.operand, symbols, line.number)
  (opcode << 12) | (operand & 0xFFF)
end

def disassemble(word)
  op = MNEMONIC.fetch(word >> 12, "???")
  operand = word & 0xFFF
  NO_OPERAND.include?(op) ? op : "#{op} #{operand}"
end

lines = parse(SOURCE)
symbols, layout, size = first_pass(lines)

puts "== pass one: symbol table =="
puts "source lines parsed: #{lines.size}, image words: #{size}"
symbols.sort.each { |name, addr| puts format("  %-6s = %2d", name, addr) }

image = layout.map { |_addr, line| encode(line, symbols) }

puts
puts "== pass two: encoded image =="
layout.each_with_index do |(addr, line), i|
  source = line.word? ? "WORD #{line.operand}" : "#{line.op} #{line.operand}".strip
  puts format("%2d: %04X  %-12s ; %s", addr, image[i], disassemble(image[i]), source)
end

puts
puts "== round trip =="
reencoded = layout.each_with_index.map { |(_a, line), i| encode(line, symbols) == image[i] }
puts "every word re-encodes identically: #{reencoded.all?}"
puts "opcodes used: #{image.map { |w| MNEMONIC.fetch(w >> 12, "???") }.tally.sort.inspect}"

puts
puts "== execute the image =="
def run(image, limit: 200)
  mem = image.dup
  acc = 0
  pc = 0
  output = []
  steps = 0
  while pc < mem.size && steps < limit
    steps += 1
    word = mem[pc]
    op = MNEMONIC.fetch(word >> 12, "???")
    operand = word & 0xFFF
    pc += 1
    case op
    when "LDA" then acc = mem[operand]
    when "LDI" then acc = mem[mem[operand]]
    when "STA" then mem[operand] = acc
    when "ADD" then acc += mem[operand]
    when "SUB" then acc -= mem[operand]
    when "JMP" then pc = operand
    when "JZ"  then pc = operand if acc.zero?
    when "OUT" then output << acc
    when "HLT" then break
    else raise "bad opcode #{op}"
    end
  end
  [output, steps, acc]
end

table = symbols.fetch("TABLE")
output, steps, acc = run(image)
puts "TABLE begins at #{table}, first value #{image[table]}"
puts "output: #{output.inspect}  steps: #{steps}  final acc: #{acc}"

puts
puts "== error paths =="
bad = Line.new(99, nil, "NOP", "ZERO", nil)
begin
  encode(bad, symbols)
rescue ArgumentError => e
  puts "unknown mnemonic: #{e.message}"
end

undefined = Line.new(100, nil, "LDA", "NOWHERE", nil)
begin
  encode(undefined, symbols)
rescue ArgumentError => e
  puts "undefined label: #{e.message}"
end

puts "labels never collide: #{symbols.keys.size == symbols.keys.uniq.size}"
referenced = lines.map(&:operand).compact.reject { |o| o =~ /\A\d+\z/ }
puts "every referenced label resolves: #{referenced.all? { |o| symbols.key?(o) }}"
