# Loops

# 1. Set a variable of num to 5 (integer) then run this code.

# num = 4

# while num == 5
#     puts "hello world"
# end 

# What's happening here? Why isn't the loop stopping? What kind of loop is this?

# The loop is repeating because it is the varible is already equal to the number so while it is equal to 5 then it will run 

# 2. Change the variable num to 4 (remember this mutates the value). Run the same code in question 1 again. What's happening?

    # It should never run as the condition doesn't match

# 3. Now let's write our first working while loop. We need a counter and a way to increment the counter. Set a variable counter to equal 0. Create a while loop with the condition of counter less than 5. In the body of the while loop puts "Counter is currently #{counter}". After that we need to increment the counter somehow by 1. We have two options syntax wise to increment. What are they?
    
    # counter = 0

    # while counter < 5 
    #     puts "counter is currently #{counter}"
    #     counter += 1
    # end

# If you're getting:

# "counter is currently 0"
# "counter is currently 1"
# "counter is currently 2"
# "counter is currently 3"
# "counter is currently 4"

# Your done!

# 4. Change the while loop so that the final line thats printed is "counter is currently 9"

    # counter = 0

    # while counter < 9
    #     puts "counter is currently #{counter}"
    #     counter += 1
    # end

# 5. When the counter is 3 I want there to be a different puts statement. If the counter is 3 instead of "counter is currently 3" I want to print "special number 3!!!"

    # counter = 0

    # while counter <= 9 
    #     if (counter == 3)
    #         puts "Special number 3!!"
    #     elsif
    #         puts "counter is currently #{counter}"
    #     end

    #     counter += 1
    # end

# 6. Create an array of 5 food items (eg hamburger). Using a while loop iterate through the array and puts each item to screen.

    # food_items = ["Apple", "Lollie", "Grape"]
    # counter = 0


    # while counter < food_items.length
    #     puts food_items[counter]
    #     counter += 1
    # end


# 7. Keep the same while loop from above with one new addition. When the iteration gets to your favorite food puts that "this is my favorite" but instead of "this" actually use string interpolation to specify the item.

    # food_items = ["Apple", "Lollie", "Grape"]
    # counter = 0


    # while counter < food_items.length

    #     if (food_items[counter] == "Apple")
    #         puts "#{food_items[counter]} is my favourite"
    #     else 
    #         puts food_items[counter]
    #     end

    #     counter += 1
    # end

# 8. Create a counter variable and set it to 0. Generate a random integer between 1 and 100. Create an empty array with the variable name of bool. Create a while loop that loops until the number is greater than what you randomly generated. In the loop body if the counter is odd push false into the array if its even push true into the array
    # counter = 0
    # random = rand(1..100)
    # bool = []
    # puts random

    # while random > counter
    #     if (counter.odd?)
    #         bool.push(false)
    #         counter += 1 
    #     else
    #         bool.push(true) 
    #         counter += 1
    #     end
    #     puts "number is currently #{counter}"
    # end

    # puts bool
# 9. Create an array variable named coding_languages with 4 different languages in it. Call .each on it and puts each specific language we're iterating through

# 10. Repeat question 6 and 7 from the while challenges, this time we won't need a counter