// 原本的除法的Slot
orig := Number getSlot("/")

Number / := method (num, if (num == 0, 0, orig num))

// Test
(233 / 0) println
