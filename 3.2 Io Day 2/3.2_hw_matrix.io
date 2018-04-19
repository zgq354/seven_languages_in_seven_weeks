// ---------- list 2d ----------
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


// -------- matrix ---------
Matrix := List2D clone

// print
Matrix p := method(
  for (i, 0, self rows - 1, 
    "[" print
    for (j, 0, self cols - 1,
      self get(j, i) print
      " " print
    )
    "]" println
  )
)

// transpose
// 若强行转置，可能需要重新分配空间，把 get(x, y) 换成 get(y, x)......
Matrix transpose := method(
  self get = self getSlot("get") setArgumentNames(list(
    self getSlot("get") argumentNames at(1),
    self getSlot("get") argumentNames at(0)
  ) flatten)
  self set = self getSlot("set") setArgumentNames(list(
    self getSlot("set") argumentNames at(1),
    self getSlot("set") argumentNames at(0),
    self getSlot("set") argumentNames at(2)
  ) flatten)
)

mtx := Matrix clone

mtx dim(3, 3)

"Dim a 3*3 matrix:" println
mtx p

"" println

mtx set(0, 0, 1)
mtx set(1, 0, 2)
mtx set(2, 0, 3)
mtx set(0, 1, 4)
mtx set(1, 1, 5)
mtx set(2, 1, 6)
mtx set(0, 2, 7)
mtx set(1, 2, 8)
mtx set(2, 2, 9)

"Set values:" println
mtx p

"" println

mtx transpose

"Transpose:" println
mtx p

"" println

"Save as matrix.txt" println

meta := list(mtx cols, mtx rows)

file := File with("matrix.txt")
file remove
file openForUpdating
file write(meta join(", "), "\n", mtx join(", "))
file close

"Read from matrix.txt" println
file := File with("matrix.txt")
file openForReading
lines := file readLines
file close

metas := lines at(0) split(", ")
newMatrix := Matrix clone
newMatrix dim(metas at(0) asNumber, metas at(1) asNumber)

data := lines at(1) split(", ")
data foreach (i, v, newMatrix atPut(i, v asNumber))

newMatrix p


