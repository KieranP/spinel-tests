# [Runtime] `Enumerator#each` with a block answers the enumerated values instead of the receiver

> (Disclaimer: I asked Claude Opus 5 (high) to find Spinel compile/runtime issues with documented Ruby classes and methods. It found the following issue, which I manually verified for accuracy before publishing this report)

_Reproduced with `spinel 2c367cff97f1` vs `ruby 4.0.6`._

`each` called with a block on an Enumerator answers what the Enumerator yields rather than the
object the underlying method returns. `each_index` answers the Enumerator itself, a Hash
answers its pairs as an Array of Arrays, and `each_slice` and `each_with_object` answer their
own yielded values. The block runs over the right values in the right order in every case, so
only the return value is wrong. `each` on the plain `each` Enumerator answers correctly.

## Repro

```ruby
p([1, 2, 3].each_index.each { |i| i })
p({a: 1}.each.each { |k, v| k })
p([1, 2, 3].each_slice(2).each { |x| x })
p([1, 2, 3].each_with_object([]).each { |x, m| m << x })
```

Ruby 4:

```
[1, 2, 3]
{a: 1}
[1, 2, 3]
[1, 2, 3]
```

Spinel:

```
#<Enumerator: [1, 2, 3]:each_index>
[[:a, 1]]
[[1, 2], [3]]
[[1, [1, 2, 3]], [2, [1, 2, 3]], [3, [1, 2, 3]]]
```
