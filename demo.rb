require "./int_to_words"

puts "Enter any number < 1 million."
while true
  puts gets.to_i.to_words
end