#!/usr/bin/env ruby

IO.foreach("2.2 Ruby Day 2.md") do |block|
  puts block if block =~ /(.*)代码块(.*)/
end
