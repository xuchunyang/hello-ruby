#!/usr/bin/env ruby

word = ARGV[0]

unless word
  puts "Usage: #{__FILE__} word"
  exit 1
end

valid = false
File.open("/usr/share/dict/words") do |file|
  file.each_line do |line|
    if word + "\n" == line
      valid = true
      puts "#{word} is a valid word."
      break
    end
  end
end

puts "#{word} is not a valid word." unless valid
