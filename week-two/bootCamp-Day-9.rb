# -- Gems -- 
    # https://rubygems.org/
    # Gems are code which is not built into ruby all ready. Its developers building things which we can download and use
    # You have to first download the gem form one of the links - https://rubygems.org/
    # You then need to require <gem_name>
    # An example is a GeoCoder
        # require 'geocoder'

        # results = Geocoder.search("46 Berkeley St Hawthorn, Melbourne, VIC")

        # p results
    # Another example
        require 'colorize'

        puts "This is blue".colorize(:red)
# -- Handling Errors -- 
    # This is making it so we can tell the progam not to exit if it faces an error 
    # To do this you type the below - As you can see below the varible on max is no defined
    # If you use rescue it rescues the program from erroring out. If you comment out the rescue you will see the error.
    # If you put the rescue above any errors it will not run unless there is an errors
    # The keyword for throwing your own error is raise 
    # Example One
        #     def display_name(name)
        #         puts name
        #     end
        # loop do
        #     begin
        #         puts "Whats your name?"
        #         print "> "
        #         name = gets.chomp
        #         if (name == "" ) # If name is an empty string then it raises its own error
        #             raise('Name is an empty strings') # This raises our own error
        #         else 
        #             display_name(name)
        #         end
        #         display_name(name)
        #     rescue => error_obj # error can be named anything. E.g. error object, error
        #         puts "You have entered your name! Please enter it again"
        #     end
        # end
    # Example Two
        # begin 
        # total_coffees = 0
        # loop do
        #         puts "coffee counter app"
        #         puts "1.  Add a coffee"
        #         puts "2. Remove a coffee"
        #         puts "3. Total Coffees"
        #         puts "4. Exit program "
        #         user_selection = gets.chomp.to_i
        #         case user_selection
        #         when 0
        #             raise("You typed the wrong thing")
        #         when 1
        #             total_coffees += 1
        #         when 2
        #             total_coffees -= 1
        #         when 3
        #             puts total_coffees
        #         when 4 
        #             exit # This keyword exits out of a program
        #         end
        #     end
        #     rescue => error_obj
        #         puts error_obj
        # end
    # Example Three
        # begin
        # File.open("Hello.txt")
        # rescue => error
        #     puts "Sorry that file doesn't exist...Please select another file"
        # end
# -- require_relative -- 
    # This allows you to run methods from other files.
    # require_relative"<file_name>" - This is the syntax in the seperate file
    # You would then call method my_method() in the new file
    # This works for classes as well.
    # If a file is in another folder you would use require_relative"../<file_name>" - The ../ says going back and get the code you're calling from my_method
    # Or if the file is in a folder you need to access you go require_relative"<folder_name>/<file_name>"

#     require_relative "bootCamp-Day-7.rb"
#     p delhi_streets = Restaurant.new("Delhi Streets")

# # -- Moduales -- 
#     # A modual is very different from a class - You can't make objects from moduales
#     # Think of moduales to make our code more modualar and seperate our code in different files
#     # It allows us to wrap methods in a different name space and share it acrosss more files. Making it more modualar 

#     module DogApplicationProfileSection # This is just the name of the modual 
#         def self.print_dog_name(name) # Self here represents the modual it allows us to print the name. Self is the same as having DogApplicationProfileSection.print_dog_name(name)
#             return @name # This is if you are sharing it with a class
#         end
#     end

#     module DogApplicationAlgorithm # You can see you can include the same method but wrap it in a different name
#         def self.print_dog_name(name)
#             return name
#         end
#     end

#     class Dog
#         include DogApplicationProfileSection

#         def initialize(name)
#             @name = name
#         end
#     end

#     # To call it you do

#     p DogApplicationProfileSection.print_dog_name("Max")
#     p DogApplicationAlgorithm.print_dog_name("Rex")
#     tilly = Dog.new("tilly")
#     p tilly
# -- Style Guide -- 
    # You can use a gem to format/improve your code
    # <file_name> -a - This activates a GEM called RuboCop and cleans your code


