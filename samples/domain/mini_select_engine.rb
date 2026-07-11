# frozen_string_literal: true
# A miniature SQL SELECT engine over in-memory tables: it tokenises a query,
# builds a plan (projection, filter, order, limit) and executes it, printing the
# result set as an aligned table plus a plan summary.
# Inference: rows are Hash{String=>Object} with mixed Integer/String values, so
# comparison and formatting must dispatch on the runtime value type.

EMPLOYEES = [
  { "id" => 1, "name" => "ada",   "dept" => "eng",   "salary" => 120 },
  { "id" => 2, "name" => "grace", "dept" => "eng",   "salary" => 135 },
  { "id" => 3, "name" => "linus", "dept" => "ops",   "salary" => 95 },
  { "id" => 4, "name" => "barbara", "dept" => "eng", "salary" => 150 },
  { "id" => 5, "name" => "ken",   "dept" => "sales", "salary" => 88 },
  { "id" => 6, "name" => "edsger", "dept" => "ops",  "salary" => 110 }
].freeze

TABLES = { "employees" => EMPLOYEES }.freeze

class Query
  attr_reader :columns, :table, :where, :order, :limit

  def initialize(sql)
    @tokens = sql.gsub(",", " , ").split(" ")
    @columns = []
    @where = nil
    @order = nil
    @limit = nil
    parse
  end

  def parse
    i = 0
    raise ArgumentError, "expected SELECT" unless @tokens[i].downcase == "select"
    i += 1
    while i < @tokens.length && @tokens[i].downcase != "from"
      @columns << @tokens[i] unless @tokens[i] == ","
      i += 1
    end
    i += 1
    @table = @tokens[i]
    i += 1
    while i < @tokens.length
      case @tokens[i].downcase
      when "where"
        @where = [@tokens[i + 1], @tokens[i + 2], @tokens[i + 3]]
        i += 4
      when "order"
        @order = [@tokens[i + 2], (@tokens[i + 3] || "asc").downcase]
        i += 4
      when "limit"
        @limit = @tokens[i + 1].to_i
        i += 2
      else
        i += 1
      end
    end
  end

  def plan
    parts = ["scan(#{@table})"]
    parts << "filter(#{@where.join(' ')})" if @where
    parts << "sort(#{@order.join(' ')})" if @order
    parts << "project(#{@columns.join(',')})"
    parts << "limit(#{@limit})" if @limit
    parts.join(" -> ")
  end
end

def coerce(text)
  text = text.delete("'")
  /\A-?\d+\z/.match?(text) ? text.to_i : text
end

def matches?(row, cond)
  field, op, literal = cond
  left = row[field]
  right = coerce(literal)
  case op
  when "="  then left == right
  when "!=" then left != right
  when ">"  then (left <=> right) == 1
  when "<"  then (left <=> right) == -1
  when ">=" then (left <=> right) >= 0
  when "<=" then (left <=> right) <= 0
  else false
  end
end

def run(query)
  rows = TABLES.fetch(query.table)
  rows = rows.select { |row| matches?(row, query.where) } if query.where
  if query.order
    field, dir = query.order
    rows = rows.sort_by { |row| row[field] }
    rows = rows.reverse if dir == "desc"
  end
  cols = if query.columns == ["*"]
           rows.first&.keys || []
         else
           query.columns
         end
  out = rows.map { |row| cols.map { |c| row[c] } }
  out = out.first(query.limit) if query.limit
  [cols, out]
end

def render(cols, rows)
  widths = cols.each_with_index.map do |col, i|
    ([col.length] + rows.map { |r| r[i].to_s.length }).max
  end
  header = cols.each_with_index.map { |c, i| c.ljust(widths[i]) }.join(" | ")
  puts header
  puts widths.map { |w| "-" * w }.join("-+-")
  rows.each do |row|
    puts row.each_with_index.map { |v, i|
      v.is_a?(Integer) ? v.to_s.rjust(widths[i]) : v.to_s.ljust(widths[i])
    }.join(" | ")
  end
end

QUERIES = [
  "select name , salary from employees where dept = 'eng' order by salary desc",
  "select name from employees where salary > 100 order by name asc limit 3",
  "select * from employees where dept = 'ops'",
  "select id , name , dept from employees order by id asc limit 2"
].freeze

QUERIES.each do |sql|
  query = Query.new(sql)
  puts sql
  puts "  plan: #{query.plan}"
  cols, rows = run(query)
  render(cols, rows)
  p rows.length
  puts
end

q = Query.new(QUERIES[0])
p q.columns
p q.table
p q.where
p q.order
p q.limit

cols, rows = run(q)
p cols
p rows
p rows.map { |r| r[1] }.sum
p rows.map { |r| r[0] }.sort

bad = (Query.new("update employees set x = 1") rescue $!.class)
p bad

missing = (run(Query.new("select name from nowhere")) rescue $!.class)
p missing
