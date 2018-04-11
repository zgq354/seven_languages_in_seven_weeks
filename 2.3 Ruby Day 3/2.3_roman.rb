#!/usr/bin/env ruby

class Roman
  def self.method_missing name, *args
    roman = name.to_s
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")

    (roman.count("I") + 
     roman.count("V") * 5 + 
     roman.count("X") * 10 +
     roman.count("L") * 50 +
     roman.count("C") * 100)
  end
end

puts Roman.X   # 10
puts Roman.XC  # 90
puts Roman.XII # 12
puts Roman.X   # 10
