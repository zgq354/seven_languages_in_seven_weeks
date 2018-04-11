#!/usr/bin/env ruby

class Array
  def method_missing name, *args
    # puts name.to_s.class
    # TODO: 依照题意key应该是表头的字段名字吧
    index = { "one" => 1, "two" => 2, "three" => 3  }[name.to_s]
    self[index]
  end
end

class ActsAsCsv

  def each
    @result.each do |row|
      yield row
    end
  end

  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ')
    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end
  
  def headers
    @headers
  end

  def csv_contents
    @result
  end

  def initialize
    @result = []
    read
  end
end

class RubyCsv < ActsAsCsv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}
