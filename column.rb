#!/usr/bin/env ruby

require 'English'

lines = []

lines << $LAST_READ_LINE.split while gets

fields = lines.map(&:length).max

longest = Array.new(fields) do |index|
  lines.map { |line| line[index] }.map { |field| field ? field.length : 0 }.max
end

lines.each do |line|
  new_fields = []

  line.each_with_index do |field, index|
    new_fields <<
      if index == line.length
        field
      else
        format("%-#{longest[index]}s", field)
      end
  end

  puts new_fields.join '  '
end
