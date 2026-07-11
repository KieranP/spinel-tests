# [Compiler] Capturing the result of a lambda that mutates an empty Array argument fails the C build

> (Disclaimer: I asked Claude Opus 5 (high) to find Spinel compile/runtime issues with documented Ruby classes and methods. It found the following issue, which I manually verified for accuracy before publishing this report)

_Reproduced with `spinel 2c367cff97f1` vs `ruby 4.0.6`._

A lambda whose body mutates its Array parameter aborts the C build when it is called with an
empty Array held in a local and the result is assigned to a local. Printing the call directly
compiles and runs, as does the same call with a non-empty local, with the empty Array written
as a literal at the call site, or with the lambda replaced by a method. `push`, `append`,
`unshift`, `<<`, `concat` and `insert` all abort, as do `proc { |acc| … }`, `g.(e)` and `g[e]`;
a String element aborts on `sp_StrArray *` instead.

## Repro

```ruby
g = ->(acc) { acc.push(1) }
e = []
r = g.call(e)
p r
```

Ruby 4:

```
[1]
```

Spinel: compile abort (see below).

## Compile error

```
r1.rb:5: error: assigning to 'sp_IntArray *' from incompatible type 'sp_RbVal'
spinel: C compilation failed
```
