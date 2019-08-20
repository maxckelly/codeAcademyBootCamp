maths = 1 + 1 
puts "#{maths}"

name = 'Max'
puts name.upcase # This makes the whole word uppercase 
puts name.capitalize # Makes the first letter a capital
puts "Hey there! Whats your name?"
name = gets.chomp
puts "Hi #{name}, can you tell me how old are you?"
age = gets.chomp
puts "That's great so everyone calls you #{name} and your age is: #{age}. Whats your favourite sport?"
sport = gets.chomp
puts "How many siblings do you have #{name}?"
siblings = gets.chomp
puts "Thats great so here is what we know about you: Your name is #{name} you're #{age}, you love #{sport} and you have #{siblings}"
