# .each drills

# 1. The following array will be used in the .each challenges

    beatles = ['george harrison', 'ringo starr', 'john lennon', 'paul mccartney']

# a. Using .each print each of the beatles to the screen

    # beatles.each do |beatle|
    #     puts beatle
    # end

# b. Using .each print each of the beatles to the screen except for john lennon

    # beatles.each do |beatle|
    #     if (beatle != "john lennon")
    #         puts beatle
    #     end
    # end
    
# c. Using .each print out the message "<the name of the beatle> was a founding member of the band the beatles"

    # beatles.each do |beatle|
    #     puts "#{beatle} was a founding member of the band the beatles"
    # end


# d. Define a hash called beatles, in it have a members key with the value of the array defined above, also have an instruments key with the value of an array which is ['guitar', 'drums', 'bass', 'keyboard']

    beatles_hash = {
        members: beatles,
        instruments: ["Guitar", "Drums", "Bass", "Keyboard"]
    }

# e. Using .each_with_index print out the message "<the name of the beatle> was a founding member of the band the beatles, and they played <an instrument>"

    # beatles[:members].each_with_index do |beatle, index| # the index has to be named index this can't be changed
    #    puts "#{beatle} was a founding member of the band the beatles, and they played #{beatles[:instruments][index]}"
    # end


# f. Using .each print out each of the beatles to the screen... but only their first names

    # beatles.each do |beatle|
    #     name = beatle.split(' ')
    #     p name.fetch(0)
    # end

# g. Define an array named rock_stars, using .each push each of the beatles into the array rock_stars and then print rock_stars.

    # rock_stars = []
    # beatles.each do |beatle|
    #     rock_stars.push(beatle)
    # end

    # p rock_stars

# h. Using .each_with_index loop through the beatles array until you get to john lennon then print "john lennon has an index of <index>"

    # beatles.each_with_index do | beatle, index |
    #    if (beatle == "john lennon")
    #     puts "#{beatle} has a index of #{index}"
    #    end
    # end 

# i. Using .each, if the beatle has a first name longer than 4 letters push their name into an array called beatles_with_long_names, print this array

    # beatles.each do |beatle|

    #     first_name = beatle.split(' ')

    #     if (first_name.fetch(0).length > 4)
    #         puts "Has long name"
    #     else 
    #         puts "No long names"
    #     end
    # end

# j. Using .each and .upcase, loop through the array and .upcase all the beatles and push their new upcased name into a new array called upcased_beatles, print upcased_beatles

    
    # upcased_beatles = []

    # beatles.each do |beatle|
    #    upcased_beatles.push(beatle.upcase)
    # end

    # p upcased_beatles

# .map drills

# 2. The following array will be used in the first set of .map challenges

    numbers = [1, 2, 3, 4]

# a. Using .map, add one to each of the items is the numbers array, you should store this new array in a variable called plus_one, when you print plus_one it should be [2, 3, 4, 5]

    # plus_one = []
    # numbers.map do |number| 
    #     number = number + 1
    #     plus_one.push(number)
    # end

    # puts plus_one

# b. Using .map create the following array [10, 20, 30, 40], you should store this new array in a variable called times_ten

    # times_ten = []
    # numbers.map do |number|
    #     number = number * 10
    #     times_ten.push(number)
    # end

    # puts times_ten

# c. Using .map create the following array [0, 1, 2, 3], you should store this new array in a variable called minus_one

    # minus_one = []
    # numbers.map do |number|
    #     number = number - 1
    #     minus_one.push(number)
    # end

    # puts minus_one

# d. Using .map transform each item in the array so that it now contains the string "<number> is an item in the array"

    # numbers.map do |number|
    #     number.to_s
    #     puts "#{number} is an item in the array"
    # end

# e. Using .map if the number is less than 3 return nil otherwise keep the original number

    # numbers.map do |number|
    #     if (number < 3)
    #         puts nil
    #     end
    # end
    
# 3. The following array will be used the second set of .map challenges

    texts = ["Lorem ipsum, dolor sit amet consectetur adipisicing elit.", "Distinctio optio velit officia vel, impedit at suscipit unde.", "Nam pariatur numquam rerum. Suscipit ut earum, harum fugiat dolor amet et explicabo!"]

# a. Using .map wrap every item in the text array in <p> tags (opening and closing)

    # texts.map do |text|
    #     puts "<p> #{text} </p>"
    # end

# b. Using .map override every item in the array so that it just contains 3 strings being "Coder Academy"

    # texts.map do |text| 
    #     text = "Coder Academy"
    #     p text
    # end

# c. Using .map return the number of words that are contained in each string in the array, you should end up with [8, 9, 13] 

    # texts.map do |text|
    #     words = text.split(' ')
    #     puts words.length
    # end

# .select drills

# 4. The following array will be used in the first set of .select challenges

    numbers = [100, 276, 4, 87]

# a. Using .select, return an array with only numbers greater than 50

    # numbers_with_fifty = numbers.select do |number|
    #     number > 50
    # end

    # puts numbers_with_fifty

# b. Using .select, return an array with only numbers less than or equal to 100

    # less_than_or_equal = numbers.select do |number|
    #     number <= 100
    # end

    # puts less_than_or_equal

# c. Using .select, return an array with only numbers == to 4

    # numbers_equal_four = numbers.select do |number|
    #     number == 4
    # end

    # puts numbers_equal_four

# 5. The following array will be used in the second set of .select challenges

shoes = [
  {
    brand: 'nike',
    name: 'air zoom structure'
  },
  {
    brand: 'adidas',
    name: 'ultraboost'
  },
  {
    brand: 'nike',
    name: 'air zoom pegasus'
  },
  {
    brand: 'asics',
    name: 'gel nimbus'
  },
  {
    brand: 'asics',
    name: 'kayano'
  },
  {
    brand: 'adidas',
    name: 'pureboost go'
  },
  {
    brand: 'nike',
    name: 'epic react'
  },
  {
    brand: 'nike',
    name: 'joyride run'
  }
]

# a. Using .select, return an array of hashes that have the brand nike

    # nike_shoes = shoes.select do |shoe|
    #     shoe[:brand] == "nike"
    # end

    # puts nike_shoes

# b. Using .select, return an array of hashes that have the brand adidas

    # adidas_shoes = shoes.select do |shoe|
    #     shoe[:brand] == "adidas"
    # end

    # puts adidas_shoes

# c. Using .select, return an array of hashes that have the brand nike or asics

    # nike_asics = shoes.select do |shoe|
    #     shoe[:brand] == "asics" || shoe[:brand] == "nike"
    # end

    # puts nike_asics

# .find drills

# 6. The following array will be used in the second set of .find challenges

    numbers = [987, 43, 299, 101]

# a. Using .find, return the first item from the array that's less than 200

    # number_less_than_200 = numbers.find do |number|
    #     number < 200
    # end
 
    # p number_less_than_200

# b. Using .find, return the first item from the array that's greater than 200 but less than 300

    # number_between = numbers.find do |number|
    #     number > 200 && number < 300
    # end

    # p number_between

# 7. The following array will be used in the second set of .find challenges

teams = [
  {
    name: 'Collingwood',
    founded: '1892',
    ground: 'MCG'
  },
  {
    name: 'Essendon',
    founded: '1872',
    ground: 'Marvel Stadium'
  },
  {
    name: 'Melbourne',
    founded: '1858',
    ground: 'MCG'
  },
  {
    name: 'St Kilda',
    founded: '1873',
    ground: 'Marvel Stadium'
  },
  {
    name: 'North Melbourne',
    founded: '1869',
    ground: 'Marvel Stadium'
  },
  {
    name: 'Footscray',
    founded: '1883',
    ground: 'Marvel Stadium'
  },
  {
    name: 'Hawthorn',
    founded: '1902',
    ground: 'MCG'
  },
  {
    name: 'Richmond',
    founded: '1885',
    ground: 'MCG'
  },
  {
    name: 'Carlton',
    founded: '1864',
    ground: 'Marvel Stadium'
  },
  {
    name: 'Geelong',
    founded: '1859',
    ground: 'GMHBA Stadium'
  }
]

# a. Using .find, return the first item from the array of hashes that has a founding year of 1873

    # founding_year = teams.find do |team|
    #     team[:founded] == '1873'
    # end

    # p founding_year 

# b. Using .find, return the first item from the array of hashes that has a name starting with 'C'

    # starting_c = teams.find do |team|
    #     team[:name].include?("C")
    # end

    # p starting_c

# c. Using .find, return the first item from the array of hashes that has the ground 'GMHBA Stadium'

    # return_array = teams.find do |team|
    #     team[:ground].include?("GMHBA Stadium")
    # end

    # p return_array

# d. Using .select, return the items that have the ground 'MCG', then on that filtered array use the .find method to select the first team that was founded before 1860

    mcg = teams.select do |team| 
        team[:ground].include?("MCG")
    end

    
    founded_in = mcg.find do |found|
        found = to_i
        found[:founded] < 1860
    end
    p mcg
    p founded_in
# binding.pry drills

# require 'pry'
# To use pry:
# 1. > gem install pry (we've all already done that!)
# 2. Uncomment line 183 (require 'pry')

# 8. Follow the instructions

# a. Uncomment the while loop code below

# counter = 0

# while counter < 10
#   puts "hello"
#   binding.pry
#   counter += 1
# end 

# b. Execute the code 
# > ruby 01-26-each-map-select-find-pry.rb

# c. Notice that the code stops at the binding.pry, this is our breakpoint, type the word counter into terminal and see what value is returned

# d. Now type continue and notice that the code stops again

# e. Repeat steps c and d 5 times, notice what counter is returning

# f. Type exit! to get out of the binding.pry loop