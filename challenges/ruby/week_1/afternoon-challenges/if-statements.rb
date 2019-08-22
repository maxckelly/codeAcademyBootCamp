# Basic control flow

# 1. Uncomment this code and run it: 
# if(false) 
#     puts "hello"
# else
#     puts "goodbye"
# end 

# What does it puts to the screen? Why is this the case?
    # This puts "Hello" - This is because there is no reason why it would be false. Everything is assumed true unless told that its not
# 2. Now replace the `if(true)` with `if(false)`
    # This is because it is saying if false puts hello but the code is true so it then skips that and goes to the else statemnent putting goodbye
# What does it output now. Why?
    # This is because it is saying if false puts hello but the code is true so it then skips that and goes to the else statemnent putting goodbye

# 3. Create a variable that stores a pet as a boolean

    # pet = true
# Create an conditional that if pet is true puts to the screen "I have a pet", else puts to the screen "I don't have a pet".

    # if (pet)
    #     puts "I have a pet"
    # else
    #     puts "I don't have a pet"
    # end

# 4. Change the boolean that is stored in pet and run this code again.

    # if (pet == false)
    #     puts "I have a pet"
    # else
    #     puts "I don't have a pet"
    # end

# 5. Define a variable name, that stores your own name as a string. 

    # name = "Max"

# Run a conditional that puts to the screen "Hi, my name is #{name}" if name is equal to your own name, and otherwise puts "that isn't my name!!!". Change the string being stored in name and check that the output makes sense.

    # if (name == 'Max') 
    #     puts "Hi, my name is #{name}"
    # else 
    #     puts "That isn't my name!!"
    # end

# 6. Now instead of setting the name variable as a hard coded string, I want you to get the name from the command line using gets. 

    # print "> "
    # name = gets.chomp.strip.capitalize

    # if (name == 'Max') 
    #     puts "Hi, my name is #{name}"
    # else 
    #     puts "That isn't my name!!"
    # end

# Test out the difference between using gets.chomp and gets.strip (you likely need to use either chomp or strip every time you invoke a gets) 
    
    # get.stripe just removes the white space
    # gets.chomp chomps it down

# 7. Our admin is on level 8. The FastTrack classroom is on level 12. The GenTech classroom is on Level 13. The Cyber Bootcamp is on Level 13 also. Have the user let you know which floor they are on, and tell them which aspects of the Coder business they can visit at that floor. Now turn it around and have them enter which room they are in (FastTrack, Cyber, etc), and let them know which floor they are on.
    
    # p "Hi, are you either in 1. Admin 2. Fasttrack 3. The Gentech 4. The Cyber Bootcamp"
    # print "> "
    # question = gets.chomp.capitalize

    # if (question == "Admin") 
    #     puts "You're on level 8"
    # elsif (question == "Fasttrack")
    #     puts "You're on level 12"
    # elsif (question == "The Gentech")
    #     puts "You're on level 13"
    # elsif (question == "The Cyber Bootcamp")
    #     puts "You're on level 13"
    # else 
    #     puts "You don't have a room"
    # end

# 8. Ask a user how many coffees they drink in a day.

    # p "How many coffees do you have per day?"
    # print "> "
    # coffees = gets.chomp.capitalize

    # if coffees == "0"
    #     p "Saving $$$"
    # end

    # if coffees != coffees.to_i.to_s
    #     puts "Invalid number"
    #     elsif (coffees.to_i == 1)
    #         puts "A little bit of caffeine doesn't hurt!"
    #     elsif (coffees.to_i == 2)
    #         puts "I need my coffee hit"
    #     elsif (coffees.to_i == 3)  
    #         puts "Hmm it's getting a bit much"
    #     else (coffees.to_i <= 3)
    #         puts "AHH so much caffeine"
    # end

# 10. The user will enter a time in 24 hour notation using a decimal as the delimiter (so 5:38pm would be 17.38). If the user enters a time that is less than 12 puts out "Morning"; if the time entered is exactly 12, respond with "Midday"; if time is greater than 12 but less than or equal to 13 puts "Lunch"; if the time is after 13, but before 7pm, puts "Afternoon"; if the time entered is less than or equal to 21 but more than or equal to 19 puts "Dinner time"; if time is greater than 21 but less than or equal to 23 puts "Time for bed". If they enter 0 or 24, respond with "Midnight". If the time isn't in the 24 hour range puts "Not a real 24 hour time".
# You can add in more responses as you see the need.

    # print "> "
    # whats_the_time = gets.chomp.to_i
    

    # if (whats_the_time >= 12)
    #     puts "Morning"
    # elsif (whats_the_time == 12)
    #     puts "Midday"
    # elsif (whats_the_time > 12 && whats_the_time >= 13)
    #     puts "Lunch"
    # elsif (whats_the_time < 13 && whats_the_time > 7)
    #     puts "Afternoon"
    # end
    


# 11. Have the user enter an integer. If their integer is odd puts "it's odd", and if their integer is even puts "it's even". There are two different ways to go about this, using a modulo operator and using ruby integer methods, answer the question using both of these approaches.

# 1. What does the following expression evaluate to?

# true = 6

# 2. Demonstrate that "anhar" is the same as "anhar"

# 3. What does the following expression evaluate to?

# 20 != 20

# 5. What does the following expression evaluate to?

# 10 > 4

# 6. What does the following expression print?

# if 5 > 4
#   puts "5 is greater than 4"
# end

# 7. What does the following expression print?

# if 5 < 4
#   puts "5 is less than 4"
# else
#   puts "5 is not less than 4"
# end

# 8. What does the following expression print?

# if "sam" == "cat"
#   puts "sam equals cat"
# elsif "matt" == "matt"
#   puts "matt equals matt"
# else
#   puts "whatever"
# end

# 9. What does the following expression print?

# if 5
#   puts "Hello there"
# end

# 10. What does the following expression print?

# if "bob"
#   puts "bob is truthy"
# else
#   puts "bob is falsey"
# end

# 11. What does the following expression print?

# if nil
#   puts "nil is truthy"
# else
#   puts "nil is falsey"
# end

# 12. What does the following expression print?

# puts "This syntax is cool" if true

# 13. What does the following expression print?

# puts "Tall buildings" if false