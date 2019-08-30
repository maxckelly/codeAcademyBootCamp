# I want you to just have a quick play with the gem 'colorize' https://github.com/fazibear/colorize
# 1. Figure out how to install the gem
# 2. Make a quick ruby app that lets you input numbers into a gets.chomp
# 3. If the number is below 10 then puts a message "your number is below 10" and make this text blue
# 4. If the number is above 10 then puts a message "your number is above 10" and make this text red
    require 'colorize'

    puts "Input a number"
    print "> "
    numbers = gets.chomp.to_i

    if (numbers < 10)
        puts "Your number is below 10".colorize(:blue)
    elsif (numbers > 10)
        puts "Your number is above 10".colorize(:red)
    end

