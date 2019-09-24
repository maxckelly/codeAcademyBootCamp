# 1. Define a method called temperature_colour
# 2. Call the method and pass it an argument that represents celsius as an integer
# 3. Write some control from logic that returns different strings
    # a. If the celsius is lower than 10 puts it's freezing
    # b. If the celsius is higher than 10 but lower than 30 puts it's pretty good 🤙
    # c. If the celsius is higher than 30 puts it's boiling
    # d. Use the colorize gem to make the different strings different colors: blue for "its freezing", yellow for "it's pretty good 🤙" and red for "its boiling"
    # e. Move the method call into another file named app.rb, use require_relative to make this work

require 'colorize'

    def temperature_colour(temperature)
        temperature.to_i
        if (temperature < 10) 
            puts  "It's freezing".colorize(:blue)
        elsif (temperature > 10 && temperature < 30)
            puts "Its pretty good".colorize(:green)
        elsif (temperature > 30)
            puts "Its boiling".colorize(:red)
        end
    end

    # This method is being called in app.rb





