# Git cloning - To clone a repo you must get the repo https//:
# However once you have SSH setup you should always use that. 
# git remote -v - This checks if you're connected to the repo
# fetch and pull are the same words

# -- How to setup SSH on your computer --

    # Step One: Open a tab for - https://github.com/settings/keys
    # Step Two: Open a tab for - https://help.github.com/en/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key 
    # Step Three: Paste ssh-keygen -t rsa -b 4096 -C "your_email@example.com" into your terminal 
    # Step Four: Follow through the steps. DON'T NEED TO ENTER A PASSWORD
    # Step Five: Once you have followed the steps and completed cd back to home
    # Step Six: Once in home cd .ssh
    # Step Seven: ls
    # Step Eight: cat id_rsa.pub
    # Step Nine: What is displayed is your key. Copy the key from the start of ssh-rsa to the end of your email
    # Step Ten: Go back to https://github.com/settings/keys and hit create new key
    # Step Eleven: Paste the key into the area and add a title. 
    # DONE

# -- GIT How to push to a branch --
    # Git checkout -b branch name - This creates a new branch
    # Git status - checks any changes you've made to the files
    # Git add . 
    # Git status 
    # Git commit -m "comment" - Commits changes to the branch 
    # Git checkout <branch_name> to go back to the branch you want - e.g. git checkout master
# -- GIST --
    # gist <file_name> - This simply pushes code to your gist. It will return a link which you can click to. 

# -- How to navigate amongst the repos -- 
    # Git checkout branch name - e.g. git checkout master - This will move be back to master. Or git checkout branch

# -- String Concatination --
    # String concatination merges two string togther. For example: 
    # p "String" + "Concatination"

# -- String interplation --
    # ALways use the quotes when you're using string interplation. This is for Ruby.
    # first_name = "Max"
    # last_name = "Kelly"
    # p "My name is #{first_name} #{last_name}"

# -- Ways to print --
    # The below three are mainly used to print to the terminal
    # 1. print
    # 2. puts
    # 3. p

    # puts "This is \n puts"
    # p "This is p"
    # print "This is print"

# -- Escaped Characters -- 
    # https://en.wikibooks.org/wiki/Ruby_Programming/Strings 
    # Escaped characters are things like - new line, !, @, #, $, %, &, *, () etc...
    # Escaped characters can only be used with puts 
    # To use these characters you can use \n (\n makes a new line)

# -- Conversions Methods --

    # Converting Integer - .to_i
        # Converting String - .to_s
        # Converting float - .to_f
        # See below for how you use:
        # You can check what the datatype is by using .class - See below

    # String - Integer 
        # p string_number = "10" # Defines a varible
        # p string_number.class # Says its a string
        # int_number = string_number.to_i # Changes the string to integer 
        # p int_number.class # prints saying its a integer

    # Integer - String 
        # another_number = 100
        # p another_number.class
        # another_number_to_string = another_number.to_s
        # p another_number_to_string.class

    # Integer - Float
        # another_number = 100
        # p another_number.class
        # another_number_to_string = another_number.to_f
        # p another_number_to_string.class


# -- More Methods --
    # .chomp - This removes the line and any escape characters See below on how it works
    # .chomp - always returns a string to convert to a integer you use .to_i - name = gets.chomp.to_i
        # name = gets
        # p name
        # name = gets.chomp
        # p name

    # .stripe - This removes the spaces 
        # name = "Max   "
        # p name
        # p name.strip

# -- Increasing a integar on a string --
    # siblings = 3 
    # siblings = siblings + 1 #or 
    # siblings += 1
    # You can alos increase it in the sentance like the below
        # puts  "Total sibilings: #{siblings + 1}"

# -- Operators -- 
    # Operators are ways to return either true or false
    # >= - Greater than or equal too.
    # <= - Less than or equal too
    # < - Greater than
    # > - Less than
    # && - means and if this is... - Used in if statements mainly 
    # || - This means "or" - So if x or y
    # Example of operators:
        # "Max" == "Kelly" - false the two datatypes aren't the same
        # 1 >= 100 - returns false 
        # 1 < 100 - returns true 
    # You can also make it so the operates always appear as the oppisite. See below
        # 1 != 2 - this returns true because. Where if we removed ! it would return false as 1 is not equal to 2 

# -- If statements --
    # An If statement must always has an end 
    # Basic Examples of if statements

        # ExampleOne:

        # name = "Max"

        #if (name == "Max")
            # puts "Hello World"
        #else 
            # puts "Go away"
        #end 

        # ExampleTwo: 

        #if 100 < 99 
            # puts "Hello World"
        #else 
            # puts "Nope this si wrong"
        #end 

        # ExampleThree: 

        #if (100 < 99 
            # puts "Hello World"
        #elsif 200 > 99 
            # puts "Nope this is wrong"
        #else
            # puts "true"
        #end 

    # if you're && or || you need to put the varible on the other end - see example

            # p "How many coffees do you have per day?"
            # print "> "
            # coffees = gets.chomp.capitalize.to_i

            # if (coffees == 0 || coffees == "zero") 
            #     puts "Saving $$!"
            # elsif (coffees == 1 || coffees == "one")
            #     puts "A little bit of caffeine doesn't hurt!"
            # elsif (coffees == 2 || coffees == "two")
            #     puts "I need my coffee hit"
            # elsif (coffees == 3 || coffees == "three")  
            #     puts "Hmm it's getting a bit much"
            # else (coffees < 3)
            #     puts "AHH so much caffeine"
            # end

