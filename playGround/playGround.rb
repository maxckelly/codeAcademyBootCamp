# name = 'Max'
# puts name.upcase # This makes the whole word uppercase 
# puts name.capitalize # Makes the first letter a capital
# puts "Hey there! Whats your name?"
# name = gets.chomp
# puts "Hi #{name}, can you tell me how old are you?"
# age = gets.chomp
# p "That's great so everyone calls you #{name} and your age is: #{age}. Whats your favourite sport?"
# sport = gets.chomp
# p "Cool, so your favourite sport is #{sport} and how many siblings do you have?"
# siblings = gets.chomp
# p "Okay here is what we know about you #{name}: Your favourite sport is #{sport} and you played that with your #{siblings} siblings"

# x = 2
# y = 3
# puts "The result of adding #{x} to #{y} is 5"

puts "What's the time (hour 24 time)"

print "> "

time = gets.chomp.to_i
p time

if time < 12
    puts "It's the morning"
    elsif time >= 13 && time <= 24 
        puts "It's the night time"
    else 
        puts "I can't read the time...error"
end
    

