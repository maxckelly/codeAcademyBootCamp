# **Core:**

require 'time';

# **1.** Print out how old you are in seconds

# date_of_birth = '1997-12-06' 

# def alive(secs) 
#   [
#     [60, :seconds],
#     [60, :minutes],
#     [24, :hours],
#     [365, :days],
#     [100, :years],
#   ].map do | count, name|
#     if secs > 0
#       secs, n = secs.divmod(count)
#     end
#   end.compact.reverse.join(' ')
# end

# loop do
#   distance = Time.new - Time.parse(date_of_birth)
#   print alive(distance)+"/r"
#   sleep 1
# end

# **2.** Create a method called highest_number that takes in two numbers and returns the higher of the two

# def highest_number(num1, num2)
#   if num1 > num2 
#     puts num1
#   elsif num2 > num1 
#     puts num2
#   else
#     puts "Numbers are the same"
#   end
# end

# highest_number(50,100)

# **3.** Create a method that takes a number as input and returns "This is a prime number", if its a prime number, else, "This is not a prime number"


# **4.** Prompt the user to enter their name. If its longer than 7 letters, return "By golly, thats a long name!", otherwise return, "Hi there new friend"

# puts "Please enter in your name"
# print "> "
# user_name = gets.chomp

# if user_name.length >= 7 
#   puts "By golly, thats a long name!"
# else
#   puts "Hi there new friend"
# end



# **5.** Create a method that takes a string, and returns the amount of vowels in that string. *E.g* If the string "How many vowels" is passed through, the method will return "There are 4 vowels in this word"

# def method_string(string)
#   string_split = string.split(" ")
#   p string_split
#   return "This has #{string_split.length} vowels in it"
# end

# puts method_string("Max Kelly is awesome")


# **6.** Create a method that will take a 24hr timestamp as an integer (e.g. 9AM will be 0900, 3:35PM will be 1535) and, using conditional logic, if its:

# def timestamp()
#   puts "Please enter a 24 Hour time"
#   user_input = gets.chomp
#   if user_input >= "0" && user_input <= "1200"
#     puts "Its morning"
#   elsif user_input > "12" && user_input <= "13"
#     puts "Its lunch time"
#   elsif  user_input >= "1300" && user_input <= "1500"
#     puts "Happy hour"
#   elsif user_input >= "1600" && user_input <= "1800"
#     puts "Dinner time"
#   elsif user_input >= "1800" && user_input <= "1200"
#     puts "Bedtime"
#   else 
#     puts "Invalid 24hour time"
#   end
# end

# timestamp()

# def timestamp()
#   puts "Please enter a 24 Hour time"
#   user_input = gets.chomp
#   case
#   when user_input >= "0" && user_input <= "1200"
#     puts "Its morning"
#   when user_input > "12" && user_input <= "13"
#     puts "Its lunch time"
#   when  user_input >= "1300" && user_input <= "1500"
#     puts "Happy hour"
#   when user_input >= "1600" && user_input <= "1800"
#     puts "Dinner time"
#   when user_input >= "1800" && user_input <= "1200"
#     puts "Bedtime"
#   else 
#     puts "Invalid 24hour time"
#   end
# end

# timestamp()

# ```
# * before 12noon - return its morning
# * between 12noon and 1PM - return its lunchtime
# * between 1PM and 5PM - return arvo blues
# * between 5PM and 6PM - return happy hour
# * between 6PM and 8PM - return dinner time
# * between 8PM to Midnight - return bedtime
# * past midnight (i.e. 2400 or over) - return thats not a valid 24hr time
# ```

# *Try this with both if/elsif/else and case statements!*

# **7.** Create a hash of what you ate yesterday (i.e. {breakfast: "oats", lunch: "curry" ... }). Loop through this hash, and print out what you ate yesterday!

# meals = {
#   breakfast: "Oats",
#   lunch: "Curry", 
#   dinner: "Steak"
# }

# meals.each do |meal|
#   puts meal
# end

# **8.** Create a block that will print out all even numbers between 1 and 20

# **9.** Create a method that will greet a user dynamically, based on time. It will first ask for their name, then, if its before noon, it will say "Good morning, < name >!", otherwise it will say "Good afternoon, < name >!"

puts "Hi! What is your name?"
print "> "
user = gets.chomp

class Time
  def morning?
    hour < 12
  end
  def afternoon?
    hour >= 12
  end
end


puts Time.now.morning? ? "morning #{user}" : "afternoon #{user}"

# **10.** Create a method that will take in a non-negative integer, and will return the highest possible number
# * *E.g.* If the input was 4847291, it will return 9874421

# **11.** Create a method that will take a multi-word string as input, and returns that same string, with each word capitalized. 
# * *E.g.* If the input was "tHIs IS a MuLTi wORd STiNG", should return "This Is A Multi Word String"