# -- File Handling --
    # File handling is mainly used with a file named csv.
    # You need to 'require csv' to use this
    # File.read("<file_name>") - If you run this command it will go into this csv file and turn everything to a string. NOTE: This file has to be csv
    # CSV is like an array to you can use methods such as .each etc...
    # File.open("<file_name>", "<read options>") - Read options below
        # r read-only, starts at beginning of file (default mode) - This returns a long string
        # r+ read-write, starts at beginning of file
        # w write-only, truncates existing file to zero length or creates a new file for writing
        # w+ read-write, truncates existing file to zero length or creates a new file for reading and writing
        # a write-only, starts at end of file if file exists, otherwise creates a new file for writing
        # a+ read-write, starts at end of file if file exists, otherwise creates a new file for reading and writing
    # When you inport files into our code though everything is on a seperate line. 
        # A way to fix this would be to code something like the below.
#         arr_records = []
#         File.open("examplefile.csv", "r").each_with_index do |line, index|
#             if line.length > 0 # Ensures that the line is not empty
#                 arr_records << line
#             end
#         end
#     # Ways to push strings into a file
#         File.open("examplefile.csv", "a").each_with_index do |file|
#             file.append << "Stuff to write"
#         end
#     # Open files in write mode
#         arr = ["one", "two", 34]
#         File.open("examplefile.csv", 'w') do |f| 
#             arr.each do |i|
#                 f.write(i)
#             end
#         end

# # -- Error Handling with Files --
#         file.exists?(<file_name>) # This checks if the file exists - It returns true or false

#         # Using begin and rescue 
#         begin
#             File.read("<file_name>")
#         rescue => e
#             puts "A profile occurred whilst trying to read this file!"            
#         end
# # -- Constants --
#         # To make a constant you use all capital letters. A constant is something that will never be changed.
#         # You cannot reassign constants and if you do that you will get an error
#         DAYS_OF_WEEK = "Monday"
# -- Using ARGV --
    # This is a special key word constant. 
    # ARGV holds arguments you enter into the terminal. E.g. if you type ruby <file_name> "message goes here" it will then be stored in ARGV and when ARGV is called it will display "message goes here"
# -- Automated Building --
    # This means if you have GEMS installed people can still run it without needing to install it.
# -- Shell script file --
    # If a file type has .sh this means its a shell script file
    # Anything you can do in your terminal you can do in the code.
    # To run the shell script you can use "bash <file_name.sh>" In the file directorys
    # Use this to install gems automatically
    # Example
        # touch another_ruby_file.rb # Makes a new file
        # mkdir my_dir # Makes a new directory 
        # gem install <gem_name> # Installs GEMS for the user running the build script
