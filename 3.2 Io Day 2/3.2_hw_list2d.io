List2D := List clone

List2D dim := method(x, y,
  self rows := y
  self cols := x
  for (i, 1, x * y,
    self append(nil)
  )
)

List2D set := method(x, y, val,
  self atPut(x + y * (self cols), val)
)

List2D get := method(x, y,
  self at(x + y * (self cols))
)

myList := List2D clone
myList dim(2, 3)
myList println

myList set(1, 1, 444)
myList println

myList set(2, 0, 666)
myList println

myList get(1, 1) println



