#!/usr/bin/env ruby

def count_commands(dir)
  if Dir.exist?(dir)
    count_of_execute = 0
    Dir.foreach(dir) do |file|
      file = File.expand_path(file, dir)
      if !File.directory?(file) && File.executable?(file)
        count_of_execute += 1
      end
    end
    return count_of_execute
  end
end

def longest(array)
  longest = 0
  array.each do |str|
    if longest < str.length
      longest = str.length
    end
  end

  return longest
end

vaild_paths = ENV['PATH'].split(':').delete_if { |dir| !Dir.exist?(dir) }

length_of_longest_path = longest(vaild_paths)

total_count = 0

vaild_paths.each do |dir|
  count = count_commands(dir)
  total_count += count
  printf "%-#{length_of_longest_path}s\t#{count}\n", dir
end

puts "\nYou have #{total_count} commands"
