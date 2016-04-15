#!/usr/bin/env ruby

require 'chinese_pinyin'

abort("Missing Argument") unless ARGV[0]

pinyin = Pinyin.t(ARGV[0])

File.open("./xinhua-da-zidian-pinyin.txt") do |file|
  file.each_line do |line|
    if line.split[0] == pinyin
      puts line
      break
    end
  end
end
