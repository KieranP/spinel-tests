# frozen_string_literal: true
# Kernel#printf
printf("%d %s\n", 42, "hi")
printf("%05.2f\n", 3.14159)
printf("%b\n", 10)
v421 = printf("%d\n", 5); p v421
printf("%-8s|%8s|\n", "a", "b")
printf("%e %g\n", 1234.5678, 0.000012345)
printf("%p %s\n", nil, :sym)
printf("%<n>04d\n", n: 7)
printf("%{k}\n", k: 3)
printf("%s\n", 42)
a422 = 255; printf("%#x\n", a422)
v422 = printf(""); p v422
printf("%+x\n", 255)
