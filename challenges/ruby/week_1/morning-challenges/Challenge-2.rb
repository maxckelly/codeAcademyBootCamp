# 1. Describe in words the following code:

# this_var = 0 # this_var
# this_string = "a string" # A string is a set of characters in the "quotation marks" 
# x = 5.5 # This assigns the value 5.5 to x
# badly_named = x * 7 # When badly_named runs it will times 5.5 * 7 
# fergus = "christmas tree" # Fergus is now assigned to Christmas tree so when christmas tree will be displayed when you puts fergus
# nigel = "one " + " "two " + "three." # This combines all the strings together making One Two Three.
# beer = fergus # Making the valuable beer the valuable of fergus

# 2. Take the calculations from earlier, and store them in variables. 
# That is, as you do the mathematics, store each line of the calculation in a variable, 
# and use this on the next line to calculate the next step. 

# 3. Use terminal to create a new file (e.g. `touch my-cool-app.rb`) # DONE
# 4. Open the file in your code editor (e.g. `atom my-cool-app.rb`) # DONE
# 5. Write the same Ruby code (1+1) and save + close the file.  # DONE
# 6. Run the code! We can do this with the `ruby` command. (e.g. `ruby my-cool-app.rb`) # DONE
# 7. The code runs, but nothing is returned on the screen. Add `puts` to the start of your code and try running the code again! (e.g. `puts 1+1`) # DONE
# 8. Experiment with some basic ruby! # DONE

# 9. Use interpolation to put your name on the screen # DONE
# 10. Make a new variable called 'siblings', set its value to the number of siblings you have (integer) Use code to put your number of siblings on the screen. Use interpolation to pretty it up, E.g.: "Total Siblings: 3" Use code to increase your number of siblings by one. # DONE
# 11. Use interpolation again to put your new number of siblings on the screen # DONE

###

# Calculate:

# 1. How many hours are in a year? # DONE - 365 * 24
    # hours_in_years = 365 * 24 
    # p hours_in_years 
# 2. How many minutes are in a decade? # DONE - 60 * 24 * 365 * 10 - 60 minutes, 24 hours in one day, 365 days a year, 10 years in a decade
    # minutes_in_years = hours_in_years * 10 * 60
    # p minutes_in_years
# 3. How many seconds old are you? 
    # seconds_old = 
    # p seconds_old

# Is the result a float or an integer?

# 1. 3.0 / 2 # Float - 1.5
# 2. 3 / 2.0 # Float - 1.15
# 3. 4 ** 2.0 # Float - 11.559999999999999
# 4. 4.1 % 2 # Float - 0.09999999999999964

# Why is 4.1 % 2 => 0.099. Look up in the ruby docs or google modulo

# 1. `puts` "Hello world!" onto the screen 
puts "Hello world!"
# 2. Make a new variable called 'name', set its value to your name (as a string)
name = "Max"
# 3. Use interpolation to put your name on the screen
puts "Hi #{name}"
# 4. Make a new variable called 'siblings', set it's value to the number of siblings you have (integer) Use code to put your number of siblings on the screen. Use interpolation to pretty it up, E.g.: "Total Siblings: 3" Use code to increase your number of siblings by one.
siblings = 3
puts "#{name} you have a total of: #{siblings} sibings"
# 5. Use interpolation again to put your new number of siblings on the screen
siblings += 1
puts siblings

