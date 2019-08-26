# Working with methods

# 1. Define a method that takes a string as an argument, and then puts this string to screen. Call this argument three times, once with your name, and two more times with the names of two classmates.

    # def name(aString)
    #     return aString
    # end

    # name1 = "Max"
    # name2 = "John"
    # name3 = "Alex"

    # p name("Max")
    # p name(name2)
    # p name(name3)

# 2. Define a method that takes two arguments and makes a hash out of them; the first argument being the first value and the second being the second value. You can choose what to call your keys. Return this hash from the method. Now call the method three times with different values each time. Store the result of these method calls in variables, and check that these variables contain hashes.

    # def method_with_two_arguments(argu1, argu2)
    #    return users = {
    #         name: argu1,
    #         age: argu2
    #     }
    # end

    # p method_with_two_arguments("Max", 21)


# 3. Define a method that takes in a number, and tells you whether it is odd or even. Call the method with 3 odd numbers and 3 even numbers.

    # def odd_even(num1)
    #     if (num1.even?)
    #         return "Even"
    #     else ()
    #         return "False"
    #     end
    # end

    # p odd_even(2)

# 4. Define a method that takes in no arguments and prints/puts to screen the date today

    # def date()
    #     puts Time.now
    # end
   
    # date()

# 5. Calculate the area of the following shapes: rectangle, triangle, circle.

    # def circle(radius)
    #     return π * radius
    # end

    # p circle(190)

    # def rectangle(length, width)
    #     return length * width
    # end

    # p rectangle(19, 30)

    # def triangle(base, height)
    #     return height * base / 2
    # end

    # p triangle(19, 30)
   
# 6. Create a temperature converter that converts the temperature from celsius to fahrenheit.

    # def converter_to_fahrenheit(temp)
    #     return temp * 9/5 + 32
    # end

    # p converter_to_fahrenheit(20)
   
# 7. Implement methods that perform all of the basic arithmetic functions.

    # def basic_arithmetic(num1, num2, operator)

    #     if (operator == "+")
    #         return num1 + num2
    #     elsif (operator == "-")
    #         return num1 - num2
    #     elsif (operator == "*")
    #         return num1 * num2
    #     elsif (operator == "/")
    #         return num1 / num2
    #     else 
    #         return "Enter an argument"
    #     end
    # end 

    # p basic_arithmetic(30, 10, "/")
   
# 8. Write function that translates a text to Pig Latin and back.
#    - English is translated to Pig Latin by taking the first letter of every word, moving it to the end of the word and adding 'ay'.
#    - "The quick brown fox" becomes "Hetay uickqay rownbay oxfay".

    def translate(sent)
        sent = sent.downcase
        vowels = ['a', 'e', 'i', 'o', 'u']
        words = sent.split(' ')
        result = []

    words.each_with_index do |word, i|
        translation = ''
        qu = false
        if vowels.include? word[0]
            translation = word + 'ay'
            result.push(translation)
        else
            word = word.split('')
            count = 0
            word.each_with_index do |char, index|
                if vowels.include? char
                    # handle words that start with 'qu'
                    if char == 'u' and translation[-1] == 'q'
                        qu = true
                        translation = words[i][count + 1..words[i].length] + translation + 'uay'
                        result.push(translation)
                        next
                    end
                    break
                else
                    # handle words with 'qu' in middle
                    if char == 'q' and word[i+1] == 'u'
                        qu = true
                        translation = words[i][count + 2..words[i].length] + 'quay'
                        result.push(translation)
                        next
                    else
                        translation += char
                    end
                    count += 1
                end
            end
            # translation of consonant words without qu
            if not qu
                translation = words[i][count..words[i].length] + translation + 'ay'
                result.push(translation)
            end
        end

    end
    result.join(' ')
    end

    puts translate("the quick brown fox") 

# 9. Implement a function that takes two numbers and an operator, and that uses your methods to perform the relevant operation

    # def basic_arithmetic(num1, num2, operator)

    #     if (operator == "+")
    #         return num1 + num2
    #     elsif (operator == "-")
    #         return num1 - num2
    #     elsif (operator == "*")
    #         return num1 * num2
    #     elsif (operator == "/")
    #         return num1 / num2
    #     else 
    #         return "Enter an argument"
    #     end
    # end 
   
# 10. Implement your own versions of: .select, .insert, .delete, .pop, .shift

# Case statements
# 11. You're running a marathon and you want to make an app for a watch to give you encouraging messages depending on certain distances you've covered.
# a. Ask the user to for input "how far have you run so far?" and store the value using gets
# b. Define a case statement for the distance and puts the following messages, when 10 puts "long way to go but you're doing amazing!", when 20 puts "almost halfway now, killing it!", when 30 puts "now for the final push, keep going!" and when 40 puts "sprint!!!!"

    # def marathon()

    #     puts "How far have you run so far?"
    #     print "> "
    #     user_input = gets.chomp.to_f
    
    #     distance = user_input

    #     if (distance <= 10)
    #         return "Long way to go"
    #     elsif (distance >= 10 &&  distance <= 20)
    #         return "Almost halfway now, killing it!"
    #     elsif (distance >= 20 && distance <= 30)
    #         return "Now for the final push"
    #     elsif (distance >= 30 && distance <= 40)
    #         return "Sprint!!!"
    #     else 
    #         return "Are you running?"
    #     end
    # end

    # p marathon()

# 12. Create a petrol calculator

# a. Ask the user how much petrol they have in the tank currently, and what their total petrol capacity is using a gets
# b. Create a percentage_capacity (out of 100) for how much fuel is currently in the tank in percentage
# c. Using a case statement when the percentage_capacity is between 1 and 25 puts "lucky you didn't run out", when the percentage_capacity is between 26 and 50 puts "fill up when the petrol price is cheap", when the percentage_capacity is between 51 and 75 puts "you already have a fair bit of fuel in the tank", when the percentage_capacity is between 76 and 100 puts "your tank is basically full!" else puts "your tank is empty" 

    # def fuel_tank()

    #     p "What is your total petrol capacity?"
    #     print "> "
    #     total_capacity = gets.chomp.to_f

    #     p "How much fuel do you have in your tank?"
    #     print "> "
    #     current_tank = gets.chomp.to_i

    #     percentage = (current_tank / total_capacity) * 100

    #     case percentage
    #     when 0 
    #         return "You've run out of gas"
    #     when 1..25
    #         return "Fill up when you see a petrol station"
    #     when 26..50
    #         return "Fill up when the petrol price is low"
    #     when 51..75
    #         return "You already have a fair bit of fuel in the tank"
    #     when 76..100
    #         return "Your tank is basically full"
    #     when 100
    #         return "Your tank is full"
    #     end
    # end

    # p fuel_tank()

# Case statements and methods

# 13. Grade calculator

# a. Define an array of hashes that stores 3 student marks, for example:
# b. Define a method named add_student_mark, that when called takes the students array as an argument, the method asks for user input about the name of the student and the mark of the student
# c. When the mark of the student is stored define another method called get_grade, this method when called takes the mark as an argument
# d. Inside of the get_grade method write a case statement, this case statement uses the mark as its case, it uses the Australian Grading System https://www.scholaro.com/pro/countries/Australia/Grading-System to return either an HD, D, C, P or N depending on what the mark is
# e. Store the return value from the get_grade method call in a variable called grade, then create a hash that includes the name, mark and grade of the student before pushing this hash into the students array
# f. Now the students array contains the new students define another method called display_students that takes the students array as an argument when called, the display students method can return nil but it needs to print to terminal the students in the following format:

    # students = [
    #     {
    #         name: "Harrison Malone",
    #         mark: 76,
    #         grade: "D"
    #     },
    #     {
    #         name: "Aaron Mendosa",
    #         mark: 96,
    #         grade: "HD"
    #     },
    #     {        
    #         name: "Harrison Malone",
    #         mark: 76,
    #         grade: "D"
    #     },
    #     {
    #         name: "Aaron Mendosa",
    #         mark: 96,
    #         grade: "HD"
    #     }
    # ]

    # def add_student_mark(students)

    #     puts "What is the students name?"
    #     print "> "
    #     student_name = gets.chomp
        
    #     puts "What was the students mark?"
    #     print "> "
    #     student_mark = gets.chomp

    #     def get_grade(student_mark)
        
    #         case student_mark 
    #             when 0
    #                 return "F"
    #             when 1..24.99
    #                 return "E"
    #             when 25..49.99
    #                 return "D"
    #             when 50..69.99
    #                 return "C"
    #             when 70..84.99
    #                 return "B"
    #             when 85..100
    #                 return "A"
    #         end
    #     end

    #     student = {
    #         name: student_name,
    #         mark: student_mark,
    #         grade: get_grade(student_mark)
    #     }

    #     students.push(student)
    # end

    # p add_student_mark(students)

# Extra challenges for methods

# 14. In this challenge, you need to write a method prime? that takes an argument and returns true or false depending on if the number is prime or not.

# You can test your answers here https://www.hackerrank.com/challenges/ruby-methods-introduction/

# 15. In this challenge, your task is to figure out what take method does using the examples below and implement the method. It should help you understand how to build on implementation through the expected functionality.

# > take([1,2,3], 1)
# [2, 3]

# > take([1,2,3], 2)
# [3]

# > take([1,2,3])
# [2, 3]

# You can test your answers here https://www.hackerrank.com/challenges/ruby-methods-arguments/

# 16. Write a method named full_name that generates the full names of people given their first name, followed by some variable number of middle names, followed by their last name.

    def full_name(first_name, *last_name)
       return "#{first_name} #{last_name.join(' ')}" 
    end

    puts full_name("Max", "Kelly", "Angus")

# You can test your answers here https://www.hackerrank.com/challenges/ruby-methods-variable-arguments/