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

# Arrays
  
# 1. Make an array of 3 different colours

    #colour = []

# 2. How do I access "blue" using an index

# 3. Store the string blue (which you accessed with an index) in a variable (also called blue, sorry for being confusing)

# 4. Create an array called four_letter_animals with the following animals (in this order):

    #four_letter_animals = ["Calf", "Duck", "elephant", "Goat", "Lamb", "lion", "Mule", "Dog"]

# Add Puma to the end of the array. Insert Joey after Goat and before Lamb. Delete Dog. Reverse the order of the array. Replace Elephant with Foal. Add Bear to the end of the array. Reverse the order of the array again

# 5. Create an array with 10 animals you'd find at the zoo

# 6. Access the 3rd, 5th and last animal using indexes (remember indexes start at 0), store these strings in variables that match the string value. There is a ruby method that allows you to access the last position in an array, use that instead of a hard coded index number

# 7. Using the variable blue you stored in question 3 create a control flow structure whereby if your colour is blue puts "blue dub a dee dub a diii" else puts "some other colour"

# 8. How do we insert a new string value into our animals array? There are many ways to do this, use a method that you haven't already

# 9. Now we have a new animal in our animals array we want to discard (remove) the animal at the start of the array.

# 10. The zoo is cutting down on costs and needs to now remove the final 5 items in the animals array.

# 11. The owner of the zoo won the lottery and can now add those same 5 animals backHow do we do this ruby an array method rather than just hard coding a new animals array.

# 12. The zoo owner has now lost track of how many animal types are in their zoo. Find out how many animals are in the array using a ruby array method.

# 13. The zoo owner wants to know if their zoo contains specifically "monkeys". Find out if the array contains monkeys (true or false) using a ruby array method.   

# 14. The zoo owner wants to have their animals sorted in alphabetical order because they're trying to be more organized. Achieve this using an array method

# 15. Create a variable some_letters which is a range of letters from a to e using the ruby range syntax. Create another variable alphabet which is a range of letters of the whole alphabet (from a to z). Go to [this link](https://ruby-doc.org/core-2.6.1/Range.html) to see how this is done (i always forget how ruby ranges work so i'll just by default go to the docs). If the some_letters array isn't equal in length to the alphabet's array in length puts 'some_letters is shorter in length than alphabet' 

# 16. Ask the user for three or more grocery items, store them in a list (array). It's OK to ask three times. Show the list to the user. Can't remember how to use a specific ruby feature/syntax? That's normal! Google + Ruby docs. Try using the `.length` method to tell the user how many items are in their list. Sort the list alphabetically before showing it to the user. Are you using gets.chomp multiple times? A 3.times loop might tidy your code. If the user tries to add 'Ice Cream', secretly replace it with 'Broccoli'. Ask the user for quantities too. Show a nice looking list back to the user.

# Loops

# 1. Set a variable of num to 5 (integer) then run this code.

# while num == 5
#     puts "hello world"
# end 

# What's happening here? Why isn't the loop stopping? What kind of loop is this?

# 2. Change the variable num to 4 (remember this mutates the value). Run the same code in question 1 again. What's happening?

# 3. Now let's write our first working while loop. We need a counter and a way to increment the counter. Set a variable counter to equal 0. Create a while loop with the condition of counter less than 5. In the body of the while loop puts "Counter is currently #{counter}". After that we need to increment the counter somehow by 1. We have two options syntax wise to increment. What are they?

# If you're getting:

# "counter is currently 0"
# "counter is currently 1"
# "counter is currently 2"
# "counter is currently 3"
# "counter is currently 4"

# Your done!

# 4. Change the while loop so that the final line thats printed is "counter is currently 9"

# 5. When the counter is 3 I want there to be a different puts statement. If the counter is 3 instead of "counter is currently 3" I want to print "special number 3!!!"

# 6. Create an array of 5 food items (eg hamburger). Using a while loop iterate through the array and puts each item to screen.

# 7. Keep the same while loop from above with one new addition. When the iteration gets to your favorite food puts that "this is my favorite" but instead of "this" actually use string interpolation to specify the item.

# 8. Create a counter variable and set it to 0. Generate a random integer between 1 and 100. Create an empty array with the variable name of bool. Create a while loop that loops until the number is greater than what you randomly generated. In the loop body if the counter is odd push false into the array if its even push true into the array

# 9. Create an array variable named coding_languages with 4 different languages in it. Call .each on it and puts each specific language we're iterating through

# 10. Repeat question 6 and 7 from the while challenges, this time we won't need a counter
