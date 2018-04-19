rand := ((Random value) * 100) ceil

rand println

i := 0
num := 0

while (i < 10 and num != rand,
  ("Guess a number between 1 to 100: (" .. i+1 .. "/10)") println
  num = ReadLine readLine
  num = if(num asNumber isNan, 0, num asNumber)
  if (num > rand, "Too high" println)
  if (num < rand, "Too low" println)
  i = i + 1
)

if (num == rand,
  "You win!" println,
  "You lose~" println
)
