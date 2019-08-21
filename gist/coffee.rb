# 8. Ask a user how many coffees they drink in a day.

p "How many coffees do you have per day?"
print "> "
coffees = gets.chomp.capitalize

if coffees == "0"
    p "Saving $$$"
end

if coffees != coffees.to_i.to_s
    puts "Invalid number"
    elsif (coffees.to_i == 1)
        puts "A little bit of caffeine doesn't hurt!"
    elsif (coffees.to_i == 2)
        puts "I need my coffee hit"
    elsif (coffees.to_i == 3)  
        puts "Hmm it's getting a bit much"
    else (coffees.to_i <= 3)
        puts "AHH so much caffeine"
end