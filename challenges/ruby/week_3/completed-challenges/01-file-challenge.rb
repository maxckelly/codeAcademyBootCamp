# Download the following csv file https://www.dropbox.com/s/4ib25i17xkqs4wt/todos.csv?dl=0

require 'csv'

# 1. Create a constant for the todo list file name
# 2. Define an empty array named todos, write a method to read the csv items (rows) into the array and then return the array with the populated todos
# 3. Write a method that neatly displays each item in the array in a numbered list 
# eg: 1. Put out garbage

    TODO_LIST_FILE = "todos.csv"
    def read_file()

        todos = []

        CSV.foreach(TODO_LIST_FILE) do |row|
            todos << row
        end
        
        todos.each_with_index do |item, index|
            puts "#{index} #{item}"
        end

        puts "What do you want to add to your to do list?"
        print "> "
        user_input = gets.chomp
        todos.push(user_input)

        puts todos
    end

    read_file()


# 4. Write a method that asks the user "what do you want to add to your to do list", and then adds this text to the todos array before writing this updated information back to the csv

# 5. Create a menu using a while loop, if the user types "1" then the todos are displayed, if the user types "2" then the while loop exits and the program terminates

# 6. Add the method and options in the menu for adding a todo

# 7. Add the method and options in the menu for deleting a todo

# 8. Add the method and options in the menu for updating a todo