# frozen_string_literal: true
# Hash#nil?
p({ a: 1 }.nil?)
a006 = { a: 1 }; p(a006.nil?)
a007 = { a: 1 }; v007 = a007.nil?; p v007

# multi-entry symbol keys
p({ a: 1, b: 2 }.nil?)
a008 = { a: 1, b: 2 }; v008 = a008.nil?; p v008

# string keys
p({ "x" => 1 }.nil?)
a009 = { "x" => 1 }; v009 = a009.nil?; p v009

# integer keys
p({ 1 => "one", 2 => "two" }.nil?)
a010 = { 1 => "one", 2 => "two" }; v010 = a010.nil?; p v010

# nested/nil values
p({ a: nil, b: [1] }.nil?)
a011 = { a: nil, b: [1] }; v011 = a011.nil?; p v011

# LIVE-LAST runtime divergence: keep as the final line (crashes spinel mid-run)
p({}.nil?)
