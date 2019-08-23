# Using hashes

# 1. Define three hashes that each have two keys. Make the value of the keys numbers. Access a value within each of these hashes and print to screen.

  # hash_one = {
  #   number_one: 99,
  #   number_two: 20
  # }

  # hash_two = {
  #   number_three: 30,
  #   number_four: 50
  # }

  # hash_three = {
  #   number_three: 30,
  #   number_four: 50
  # }
   

# 2. Extract breakfast from the following hash and print to screen

  meal_plan = {
      breakfast: 'weet-bix',
      lunch: 'sandwich',
      dinner: 'chicken salad'
  }

  # p meal_plan[:breakfast]


# 3. Define three hashes that have three keys in each and set the values to be of three different data types.

  person = {
    age: 30,
    name: "Max",
    surname: "Kelly"
  }

  person_detail = {
    height: 187,
    eye_colour: "brown",
    hobbies: ["Surfing", "Flying Helicopters", "Reading"]
  }

  person_family = {
    siblings: ["Jake", "Will"],
    ages: [24, 18]
  }

# 4. Print to screen the value and the datatype of that value.
  # p person[:age]
  # p person[:name]
  # p person[:surname]
  # p person_family[:ages]

# 5. Create a dictionary using hash. Make the keys to be words and values to be meanings of those words.

  # dictionary = {
  #   walking: "Moving your feet",
  #   running: "Moving your feet at a faster pace",
  #   crawling: "Using your hands and knees to move across the ground"
  # }

# 6. Access some words from the dictionary and print the meaning to screen.

  # p dictionary[:walking]
  # p dictionary[:running]
  # p dictionary[:crawling]

# 7. Change the values to be arrays with more than one synonym of the word.

  # dictionary = {
  #   walking: ["Moving your feet", "I'm walking slowly"],
  #   running: ["Moving your feet at a faster pace", "I'm running fast"],
  #   crawling: ["Using your hands and knees to move across the ground", "I'm crawling slowly"]
  # }

# 8. Select one word and print to screen all the synonyms using a loop.

  # for word in dictionary 
  #   puts dictionary[:walking]
  # end

# 9. Make an array of users. Each user will be a hash with the keys name, age and email.

  users = [ {
    name: 'Max',
    age: '21',
    email: 'maxckel@gmail.com'
  },
  {
    name: 'Bob',
    age: '30',
    email: 'bob@gmail.com'
  }
]


# 10. Loop through this array, printing to screen the value of each member of the array.

  # for user in users
  #   puts user
  # end

# 11. Make a hash of all the ruby data types where the keys will be the name of the datatype and the value will be an example of that datatype, e.g. string: "this is a string".

  ruby = {
    string: "This is a string",
    integer: 12,
    float: 30.5,
    boolean: true
  }

# 12. Make an array of cars, each car will be a hash with keys make, model and year.

  audi = {
    make: "audi",
    model: "Q3",
    year: 2012 
  }

  lambo = {
    make: "lambo",
    model: "Aventador",
    year: 2000
  }

  toyota = {
    make: "toyota",
    model: "Hilux",
    year: 1997
  }

cars = [audi, lambo, toyota]

# 13. Loop through this array, printing to screen the value of each member of the array.
   
  # for car in cars 
  #   puts car
  # end

# 14-20
polyjuice_potion = {
  effect: "Allows a drinker to temporarily assume the form of another person",
  ingredients: [ "Fluxweed", "Knotgrass", "Lacewing flies", "Leeches", "Horn of Bicorn", "Boomslang skin", "Piece of person you're turning into (usually hair)"],
  difficulty: "Advanced",
  brewing_time: "One month"
}

# 14. Use the .each method to print the keys and values of the hash. https://ruby-doc.org/core-2.5.1/Hash.html#method-i-each

  # polyjuice_potion.each{|key, value| puts "#{key} is #{value}"}

# 15. Use the .each_value method to print to screen only the values of the polyjuice_potion.

  # polyjuice_potion.each{|key| puts key}

# 16. Use the .each_key method to print to screen only the keys of the polyjuice_potion.

  # polyjuice_potion.each_key{|key| puts key}

# 17. Use the delete method to delete the brewing_time

  # p polyjuice_potion.delete(:brewing_time)
  
# 18. Use the include? method to find out if the brewing time is still inside the polyjuice_potion hash.

  # p polyjuice_potion.include?(:brewing_time)
  

# 19. Use the select method to select the ingredients from polyjuice_potion and save them in a variable called ingredients. Now print this variable to screen.

  ingredients = (polyjuice_potion.select {|key, value| key == :ingredients}).values

  # p ingredients

# 20. Use the slice method to select the effect and save that in a variable called effect. Print that variable to screen. - SLICE ISN'T USED IN RUBY ANYMORE

# 21.
### Season Schedule App
# This app will tell users what the current season and time of day is.
# eg. "It is a summer morning."
# Steps:
# Find out what day of the year it is (eg. 42 / 366)
# Create variables for each season - these variables should store a range of days of the year (similar to above) that covers when that season occurs.

# Check if the current day of the year falls within a certain range of days to find out what the current season is.
#
# Similarly, use ranges on the current hour of the day to identify if it's morning, noon, afternoon, evening, nighttime, midnight
# Tell the user what stage of the day & what season of the year it is.
#
# Use hashes to store the ranges for the seasons and stages of the day.

# 22.
### Category Checker
# Present the user with different categories of something.
# Then, ask them to provide a maximum number of characters for each entry.
# Based on the chosen category & maximum number of characters, show the user a list of entries.
#
data = {"chocolate things" => ["chocolate cake", "hot chocolate", "choc"], "liquids" => ["water", "hot chocolate", "cola", "juice"], "lollies" => ["skittles", "M&Ms", "licorice"]}
# eg. The app shows all categories (eg. chocolate things, liquids, lollies)
# The user wants to see liquids
# then the user wants to see liquids with 4 characters or less in their name
# the end result is "cola"

# 23.
### Contacts Terminal Edition

# Your challenge is to create a app like contacts on your phones

# Specifications

# 1. Let users go to a menu that has 3 different options: view contacts, add contacts, remove contacts and exit. This will require the use of some kind of loop. The loop keeps running until 

# 2. View should just show all entries

# 3. Add should provide prompts for each property of the entry like what is the name? ___ and what is the number? ___

# 4. Remove should ask for a name, and if that name is in the phone book then ask the user to confirm the removal. Only remove the entry once the user confirms that they want to remove it!


# They should also be able to view the phone book's entire collection of entries in a nicely formatted message.

# ---------------------------------------
# Harrison Malone +6123445468
# Educator at Coder Academy
# 120 Spencer Street, Melbourne
# ---------------------------------------
# Aaron Mendosa +6100000001
# Educator at Coder Academy
# 120 Spencer Street, Melbourne
# ---------------------------------------

# Hint: You can combine arrays & hashes!