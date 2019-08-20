name = 'Max'
puts name.upcase # This makes the whole word uppercase 
puts name.capitalize # Makes the first letter a capital
puts "Hey there! Whats your name?"
name = gets.chomp
puts "Hi #{name}, can you tell me how old are you?"
age = gets.chomp
puts "That's great so everyone calls you #{name} and your age is: #{age}. Whats your favourite sport?"
sport = gets.chomp


def make_some_files
  counter = 1
  while counter <= 10
    `touch "ruby_file_#{counter}".rb`
    counter += 1
  end 
end 

make_some_files



