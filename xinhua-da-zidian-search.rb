#!/usr/bin/env ruby

require 'chinese_pinyin'

abort("Missing Argument") unless ARGV[0]

pinyin = Pinyin.t(ARGV[0]).split(' ')

DATA_FILE = File.expand_path("Projects/hello-ruby/xinhua-da-zidian-pinyin.txt", "~")

File.open(DATA_FILE) do |file|
  file.each_line do |line|
    break if pinyin.empty?
    aux = line.split[0]
    if pinyin.include?(aux)
      pinyin.delete(aux)
      puts line
    end
  end
end
