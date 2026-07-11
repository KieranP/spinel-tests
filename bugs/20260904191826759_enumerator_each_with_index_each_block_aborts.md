# [Compiler] `Enumerator#each` with a block on an `each_with_index` Enumerator over an Array fails the C build

> (Disclaimer: I asked Claude Opus 5 (high) to find Spinel compile/runtime issues with documented Ruby classes and methods. It found the following issue, which I manually verified for accuracy before publishing this report)

_Reproduced with `spinel 2c367cff97f1` vs `ruby 4.0.6`._

Calling `each` with a block on the Enumerator returned by `Array#each_with_index` aborts the C
build. The element type appears in the diagnostic, so an Array of Strings aborts on
`sp_StrArray *` rather than `sp_IntArray *`, and capturing the result in a local aborts the
same way. The same call on a Hash receiver compiles.

## Repro

```ruby
p([1, 2, 3].each_with_index.each { |x, i| x })
```

Ruby 4:

```
[1, 2, 3]
```

Spinel: compile abort (see below).

## Compile error

```
r1.rb:14: error: incompatible pointer types initializing 'sp_Enumerator *' with an expression of type 'sp_IntArray *' [-Werror,-Wincompatible-pointer-types]
spinel: C compilation failed
```
