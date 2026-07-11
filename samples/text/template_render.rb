# frozen_string_literal: true
# A tiny mustache-style template renderer.
# Inference: gsub with a block resolves {{key}} against a Hash{String=>String},
# and sprintf/format assemble typed fields into a String.

def render(template, context)
  template.gsub(/\{\{(\w+)\}\}/) { context[$1] || "" }
end

context = { "name" => "Ada", "role" => "engineer", "team" => "compilers" }
tmpl = "{{name}} works as a {{role}} on the {{team}} team."
p render(tmpl, context)
p render("{{name}} <{{missing}}>", context)

rows = [["Ada", 95], ["Bob", 87], ["Cy", 91]]
rows.each { |name, score| puts format("%-6s %3d%%", name, score) }

p rows.map { |_, s| s }.sum
p format("total: %.1f", rows.sum { |_, s| s } / rows.length.to_f)
