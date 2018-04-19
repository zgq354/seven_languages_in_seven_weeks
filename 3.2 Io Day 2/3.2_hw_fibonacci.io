fib := method(n,
  if (n <= 2, 1,
    fib(n - 1) + fib(n - 2)
  )
)

fib2 := method(n,
  if (n < 3, return 1)
  f1 := 1
  f2 := 1
  current := 0
  for (i, 3, n, 
    current = f1 + f2
    f1 = f2
    f2 = current
  )
  current
)

fib2(6) println
fib2(2) println


