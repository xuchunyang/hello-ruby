#!/usr/bin/env ruby

byte_count = 0
line_count = 0
word_count = 0

while gets
  line_count += 1 if $_.end_with?("\n")
  word_count += $_.split.length
  byte_count += $_.bytesize
end

puts "\t#{line_count}\t#{word_count}\t#{byte_count}"
