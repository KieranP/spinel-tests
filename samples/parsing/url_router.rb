# frozen_string_literal: true
# A small HTTP router: route patterns like "/users/:id/posts/:slug" are compiled
# into anchored regexps with named captures, requests are matched against them in
# registration order, and matched params are coerced by a per-route spec.

class Route
  attr_reader :verb, :pattern, :name, :coercions

  def initialize(verb, pattern, name, coercions = {})
    @verb = verb
    @pattern = pattern
    @name = name
    @coercions = coercions
    @regexp = compile(pattern)
  end

  def compile(pattern)
    parts = pattern.split("/").reject(&:empty?).map do |seg|
      case seg
      when /\A:(\w+)\z/ then "(?<#{Regexp.last_match(1)}>[^/]+)"
      when /\A\*(\w+)\z/ then "(?<#{Regexp.last_match(1)}>.+)"
      else Regexp.escape(seg)
      end
    end
    Regexp.new("\\A/#{parts.join('/')}\\z")
  end

  def match(verb, path)
    return nil unless verb == @verb

    md = @regexp.match(path)
    return nil unless md

    params = md.names.each_with_object({}) do |n, acc|
      acc[n.to_sym] = coerce(n.to_sym, md[n])
    end
    params
  end

  def coerce(key, value)
    case @coercions[key]
    when :int then Integer(value, 10)
    when :list then value.split(",")
    else value
    end
  end

  def to_s = format("%-6s %s", @verb, @pattern)
end

ROUTES = [
  Route.new("GET", "/", "root"),
  Route.new("GET", "/health", "health"),
  Route.new("GET", "/users/:id", "user_show", { id: :int }),
  Route.new("GET", "/users/:id/posts/:slug", "post_show", { id: :int }),
  Route.new("POST", "/users/:id/posts", "post_create", { id: :int }),
  Route.new("GET", "/search/:tags", "search", { tags: :list }),
  Route.new("GET", "/assets/*path", "asset", {}),
  Route.new("DELETE", "/users/:id", "user_delete", { id: :int })
].freeze

def dispatch(verb, path)
  ROUTES.each do |route|
    params = route.match(verb, path)
    return [route, params] if params
  end
  [nil, nil]
end

def parse_query(query)
  return {} if query.nil? || query.empty?

  query.split("&").each_with_object({}) do |pair, acc|
    key, _, value = pair.partition("=")
    if key.end_with?("[]")
      (acc[key.delete_suffix("[]")] ||= []) << value
    else
      acc[key] = value
    end
  end
end

puts "routing table"
ROUTES.each { |r| puts format("  %-24s -> %s", r.to_s, r.name) }
puts

REQUESTS = [
  ["GET", "/"],
  ["GET", "/health"],
  ["GET", "/users/42"],
  ["GET", "/users/42/posts/hello-world"],
  ["POST", "/users/7/posts"],
  ["GET", "/search/ruby,compilers,aot"],
  ["GET", "/assets/css/site/main.css"],
  ["DELETE", "/users/9"],
  ["GET", "/users/42/comments"],
  ["PUT", "/users/42"],
  ["GET", "/users/notanumber"]
].freeze

puts "dispatch"
REQUESTS.each do |verb, path|
  begin
    route, params = dispatch(verb, path)
  rescue ArgumentError => e
    puts format("  %-6s %-30s 400 %s", verb, path, e.message)
    next
  end

  if route.nil?
    puts format("  %-6s %-30s 404", verb, path)
  else
    rendered = params.map { |k, v| "#{k}=#{v.inspect}" }.join(" ")
    puts format("  %-6s %-30s %-12s %s", verb, path, route.name, rendered)
  end
end
puts

puts "query strings"
[
  "page=2&per_page=25",
  "tag[]=ruby&tag[]=c&sort=desc",
  "flag&empty=",
  ""
].each do |q|
  puts format("  %-28s %s", q.inspect, parse_query(q).inspect)
end
puts

puts "scanning a request log"
LOG = <<~TXT
  GET /users/1 200 12ms
  GET /users/2/posts/intro 200 44ms
  POST /users/2/posts 201 91ms
  GET /missing 404 3ms
  DELETE /users/1 204 8ms
TXT

rows = LOG.lines.map do |line|
  verb, path, status, timing = line.split
  route, = dispatch(verb, path)
  { verb: verb, path: path, status: status.to_i, ms: timing.to_i, name: route&.name || "-" }
end

rows.each do |r|
  puts format("  %-6s %-26s %3d %4dms  %s", r[:verb], r[:path], r[:status], r[:ms], r[:name])
end
puts format("  total %d requests, %dms, %d matched a route",
            rows.size, rows.sum { |r| r[:ms] }, rows.count { |r| r[:name] != "-" })
