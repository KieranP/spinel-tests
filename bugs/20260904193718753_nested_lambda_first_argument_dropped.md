# [Runtime] First argument arrives as `nil` when the second is a call on another closed-over lambda

> (Disclaimer: I asked Claude Opus 5 (high) to find Spinel compile/runtime issues with documented Ruby classes and methods. It found the following issue, which I manually verified for accuracy before publishing this report)

_Reproduced with `spinel 2c367cff97f1` vs `ruby 4.0.6`._

A method returns a lambda that returns a second lambda, and the inner lambda closes over both
the method's parameter and the outer lambda's parameter. Calling the outer closure with the
inner one in its own argument list drops the first argument, which arrives as `nil` and raises
`NoMethodError` on the first operation against it. Hoisting the inner call into a local first
runs correctly, so only the nested argument list is affected. The accumulator type does not
matter: Array, Integer and String all raise, and the `step[acc, fn[input]]` call syntax raises
`TypeError` instead.

## Repro

```ruby
def mapping(fn)
  ->(step) { ->(acc, input) { step.call(acc, fn.call(input)) } }
end

conj = ->(acc, x) { acc + [x] }
r = mapping(->(n) { n * 3 }).call(conj)
p r.call([], 1)
```

Ruby 4:

```
[3]
```

Spinel:

```
undefined method '+' for an instance of NilClass (NoMethodError)
```
