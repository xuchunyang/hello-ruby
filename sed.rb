#!/usr/bin/env ruby

# Usage: sed 's/foo/bar/g' [file]

raw_pattern, file = ARGV[0], ARGV[1]

# Check arguments
unless raw_pattern
  puts "Usage: #{$0} PATTERN FILE"
  exit 1
end

regexp_c, to_string = raw_pattern.split('/')[1, 2]

unless regexp_c && to_string
  puts "Unknown pattern '#{raw_pattern}'"
  exit 1
end

regexp = Regexp.new(regexp_c)

if file && File.exist?(file) && !File.directory?(file)
  File.open(file) do |f|
    f.each do |line|
      puts line.gsub(regexp, to_string)
    end
  end
else
  while line = $stdin.gets
    puts line.gsub(regexp, to_string)
  end
end
