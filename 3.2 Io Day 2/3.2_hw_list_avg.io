List myAverage := method(
  sum := 0
  count := 0
  self foreach (v,
    if(v asNumber isNan, Exception raise("Some item in the list are not Number"))
    sum = sum + v
    count = count + 1
  )
  sum / count
)

list(1, 2, 3, 4, "") myAverage println





/*
  如果没有数字...

  Exception: argument 0 to method '+' must be a Number, not a 'ImmutableSequence'
  ---------
  +                                   3.2_hw_list_avg.io 5
  List myAverage                       3.2_hw_list_avg.io 11
  CLI doFile                           Z_CLI.io 140
  CLI run                              IoState_runCLI() 1
*/
