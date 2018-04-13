obj := Object clone
obj method1 := method("This is method1" println)
obj method2 := method("This is method2" println)

methodname := "method2"

obj getSlot(methodname) call
