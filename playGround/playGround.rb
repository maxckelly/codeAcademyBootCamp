name = 'Max'
puts name.upcase # This makes the whole word uppercase 
puts name.capitalize # Makes the first letter a capital
puts "Hey there! Whats your name?"
name = gets.chomp
puts "Hi #{name}, can you tell me how old are you?"
age = gets.chomp
puts "That's great so everyone calls you #{name} and your age is: #{age}. Whats your favourite sport?"
sport = gets.chomp
puts "Cool, so your favourite sport is #{sport} and how many siblings do you have?"
siblings = gets.chomp
puts "Okay here is what we know about you #{name}: Your favourite sport is #{sport} and you played that with your #{siblings} siblings"





