#!/usr/bin/env ruby

# Usage: ./grep.rb PATTERN FILE

pattern, file = ARGV[0], ARGV[1]

# Check argument
if !pattern || !(file && File.exist?(file) && !File.directory?(file))
  puts "Usage: #{$0} PATTERN FILE"
  exit 1
end

class String
  def red
    "\e[31m#{self}\e[0m"
  end
end

re = Regexp.new pattern

File.open(file) do |f|
  f.each do |line|
    if line =~ re
      puts line.sub(re, line[re].red)
    end
  end
end
