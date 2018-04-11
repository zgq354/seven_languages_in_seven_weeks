#!/usr/bin/env ruby

puts "Type and Guess!!"

r = rand(10)
while true
  i = gets().to_i
  puts "Too big" if i > r
  puts "Too small" if i < r
  if i == r
    puts "Well done!!"
    break
  end
end

