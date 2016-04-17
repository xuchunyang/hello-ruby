#!/usr/bin/env ruby

all_p = ARGV.include? '-a'
ARGV.delete('-a')
file = ARGV[0] || '.'

if !File.exist?(file)
  puts "#{__FILE__}: #{file}: No such file or directory"
  puts
  puts "Usage: #{__FILE__} [-a] [FILE]"
  puts
  exit 1
elsif File.directory?(file)
  Dir.foreach(file) do |f|
    if all_p
      puts f
    elsif !f.start_with? '.'
      puts f
    end
  end
else
  puts file
end
