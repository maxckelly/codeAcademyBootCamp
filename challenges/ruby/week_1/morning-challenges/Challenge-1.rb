# 1. Create a folder named code inside your home directory, cd into it # DONE
# 2. Inside the code directory create another directory named ruby # DONE 
# 3. cd into the ruby directory and create a week_one directory # DONE
# 4. cd back to the code directory # DONE
# 5. Create a javascript directory inside of code # DONE
# 6. Now delete the javascript directory with the rm command, we don't need javascript yet # DONE
# 7. cd back into ruby and touch two files, test.rb and command_line.rb # DONE
# 8. code . to open both files in vs code # DONE 
# 9. Create a hidden file name .secrets # DONE
# 10. Run ls -la to view it on the command line # DONE 
# 11. Confirm it's hidden by using the finder to view the directory # DONE

###

# 1. Open the shell from your command line by typing
# => pry

# 2. Try some basic math (1+1 *enter*) # DONE
# 3. Quit pry by sending the exit command # DONE
# 4. Do the same thing with `irb` # DONE

###

# 1. Use terminal to create a new file  # DONE 
# => touch my_cool_app.rb 

# 2. Open the file in your code editor # DONE
# => code my_cool_app.rb

# 3. Write the same Ruby code (1+1) and save + close the file. # DONE
# 4. Run the code! We can do this with the ruby command. 
# => ruby my_cool_app.rb # DONE

# 5. The code runs, but nothing is returned on the screen. Add puts to the start of your code and try running the code again! # DONE
# puts 1+1

###

# 1. cd into the code directory we made earlier # DONE
# 2. Make a directory named my_files and cd into it # DONE
# 3. Copy the ruby code below and put it into a file named make_files.rb # DONE

# def make_some_files
#   counter = 1
#   while counter <= 10
#     `touch "ruby_file_#{counter}".rb`
#     counter += 1
#   end 
# end 

# make_some_files

#   4. Excute the ruby code 
# => ruby make_files.rb

# 5. cd backwards to the previous directory
# 6. Find a way to delete the my_files directory from the command line 