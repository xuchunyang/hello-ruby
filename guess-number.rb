answer = rand 100
print "Enter a number in [1, 100]: "
input = gets.to_i

count = 1

while input != answer
  count += 1
  if input < answer
      print "Too small, enter a new number: "
      input = gets.to_i
  else
      print "Too big, enter a new number: "
      input = gets.to_i
  end
end

puts "Well done, after #{count} #{ count == 1 ? "guess" : "guesses"}, your guess is correct (#{answer} = #{input})."
