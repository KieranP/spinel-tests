# frozen_string_literal: true
# Array#nil?
p([1, 2, 3].nil?)
a006 = [1, 2, 3]; p(a006.nil?)
a007 = [1, 2, 3]; v007 = a007.nil?; p v007

begin; p([].nil?); rescue => e100; p e100.class; end
a100 = []; p(a100.nil?)
a101 = []; v101 = a101.nil?; p v101

p([1.1, 2.2].nil?)
a102 = [1.1, 2.2]; p(a102.nil?)
a103 = [1.1, 2.2]; v103 = a103.nil?; p v103

p(["a", "b"].nil?)
a104 = ["a", "b"]; p(a104.nil?)
a105 = ["a", "b"]; v105 = a105.nil?; p v105
