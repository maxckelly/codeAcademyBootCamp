# Arrays 

# 1. Create an array with the values 1 and 2.
    value = [1, 2]

# 2. Create an array with nothing inside it.
    empty_array = []

# 3. Create an Array that contains the values "mike tyson", 89, and 9.7.
    mike_array = ["Mike Tyson", 89, 9.7]

# 4. Identify the components of the following expression:

    students = ["mary", "kathy", "frank"]
    # p students

# 5. What does the following expression return

# ["uno", "dos", "tres"].length
# This would return 3

# 6. Is the array below array valid?

# name = "clem"
# age = 32
# [name, age]
# Yes this array is valid and prints

# 7. Get the first element of the lyric Array.

    lyric = ["laughter", "it's", "free"]
    # p lyric[0]

# 8. Get the last element of the lyric Array.
    # p lyric[2]

# 9. Add the string "open up shop" to the end of the ruff Array.

    ruff = ["stop", "drop", "shut 'em down"]
    ruff.push("Open up shop")
    # p ruff
  
# 10. Make an array of 3 different colours

    colours = ["Red", "Black", "Blue"]

# 11. How do I access "blue" using an index

    # p colours[2]

# 12. Store the string blue (which you accessed with an index) in a variable (also called blue, sorry for being confusing)

    blue = colours[2]
    # p blue

# 13. Create an array called four_letter_animals with the following animals (in this order):

    four_letter_animals = ["calf", "duck", "elephant", "goat", "lamb", "lion", "mule", "dog"]

# Add Puma to the end of the array. Insert Joey after Goat and before Lamb. Delete Dog. Reverse the order of the array. Replace Elephant with Foal. Add Bear to the end of the array. Reverse the order of the array again

    four_letter_animals.push("Puma")
    
    four_letter_animals.insert(4, "Joey")
    four_letter_animals.delete_at(four_letter_animals.index("dog"))
    four_letter_animals.reverse!
    four_letter_animals[2] = "Foal"
    four_letter_animals.push("Bear")
    four_letter_animals.reverse!

    # p four_letter_animals

# 14. Create an array with 10 animals you'd find at the zoo

    zoo_animals = ["Lion", "Elephant", "Cat", "Dog", "Kangaroo", "Puma", "Joey", "Kangaroo", "turtle", "Rhino", "Bear"]

# 15. Access the 3rd, 5th and last animal using indexes (remember indexes start at 0), store these strings in variables that match the string value. There is a ruby method that allows you to access the last position in an array, use that instead of a hard coded index number
    cat = zoo_animals[2]
    puma = zoo_animals[5]
    beer = zoo_animals.last
    
# 16. Using the variable blue you stored in question 3 create a control flow structure whereby if your colour is blue puts "blue dub a dee dub a diii" else puts "some other colour"
    # if (blue == "blue")
    #     puts "blue dub a dee dub a diii"
    # else 
    #     puts "Some other colour"
    # end

# 17. How do we insert a new string value into our animals array? There are many ways to do this, use a method that you haven't already

    zoo_animals.unshift("GOAT")
    # p zoo_animals

# 18. Now we have a new animal in our animals array we want to discard (remove) the animal at the start of the array.

    zoo_animals.shift
   #  p zoo_animals

# 19. The zoo is cutting down on costs and needs to now remove the final 5 items in the animals array.

    gone = zoo_animals.pop(5)
    # Another way to do this was zoo_animals.pop(5), zoo_animals.slice!(5..10)
    # p zoo_animals

# 20. The owner of the zoo won the lottery and can now add those same 5 animals backHow do we do this ruby an array method rather than just hard coding a new animals array.
    
    # zoo_animals.push(gone) - One way to combine array
    zoo_animals = gone += zoo_animals
    # p zoo_animals

# 21. The zoo owner has now lost track of how many animal types are in their zoo. Find out how many animals are in the array using a ruby array method.

    # p new_animals.length 

# 22. The zoo owner wants to know if their zoo contains specifically "monkeys". Find out if the array contains monkeys (true or false) using a ruby array method.

    # p new_animals.include?("monkeys")


# 23. The zoo owner wants to have their animals sorted in alphabetical order because they're trying to be more organized. Achieve this using an array method

    # zoo_animals.sort{ |a, b| a <=> b }
    zoo_animals.sort
    # p zoo_animals

# 24. Create a variable some_letters which is a range of letters from a to e using the ruby range syntax. Create another variable alphabet which is a range of letters of the whole alphabet (from a to z). Go to [this link](https://ruby-doc.org/core-2.6.1/Range.html) to see how this is done (i always forget how ruby ranges work so i'll just by default go to the docs). If the some_letters array isn't equal in length to the alphabet's array in length puts 'some_letters is shorter in length than alphabet' 

    
# 25. Ask the user for three or more grocery items, store them in a list (array). It's OK to ask three times. Show the list to the user. Can't remember how to use a specific ruby feature/syntax? That's normal! Google + Ruby docs. Try using the `.length` method to tell the user how many items are in their list. Sort the list alphabetically before showing it to the user. Are you using gets.chomp multiple times? A 3.times loop might tidy your code. If the user tries to add 'Ice Cream', secretly replace it with 'Broccoli'. Ask the user for quantities too. Show a nice looking list back to the user.

    items = []
    items.join(', ')
    items.sort

    p "What's three or more grocerys?"
    print "> "
    user_input = gets.chomp.downcase
    items = user_input.split(', ')
   
    item_length = items.length

    if (user_input = "ice cream")
        items.delete("ice cream")
        items.push("broccoli")
    end


    puts "You have a total of #{item_length} items. Each being: #{items}"

    