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

total_count = 0

ENV["PATH"].split(":").each do |dir|
  if Dir.exist?(dir)
    count = count_commands(dir)
    total_count += count
    puts "#{dir}  --  #{count}"
  end
end

puts "\nYou have #{total_count} commands"
