OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg)
  )
  r
)

Map atPutNumber := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)


Builder := Object clone

first := true

Builder forward := method(
  write("<", call message name)
  call message arguments foreach(
    arg,
    if (first,
      if(arg name == "curlyBrackets",
        first := true
        attr := self doMessage(arg)
        attr foreach(k, v, write(" " .. k .. "=\"" .. v .. "\"")))
      ">" println
      first := false
    )
    content := self doMessage(arg)
    if (content type == "Sequence", writeln(content))
  )
  writeln("</", call message name, ">")
)

str := File with("hw_builder.txt") openForReading contents
doString(str)
