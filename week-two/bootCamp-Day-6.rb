# -- Array - Methods -- 
    # Methods to loop through an array is 
        # .each - This is an easier way to loop through an array 
            # names = ["Max", "John", "Alex", "Smith"]
            # names.each do |name| # The | | are called "Pipes" This is where the key word for each individual value goes.
            #     # body of the block
            #     puts name + "loser"
            # end
            # If you assign an array to this then it will just return the same array e.g. ["Max", "John"]
            # Another syntax to use this in is: 
            # names.each { |name| puts name }
        # .push - This allows you to push value into Array's 
            # names = ["Max"]
            # loser_names = []
            # names.each do |name|
            #     losers = name + "loser"
            #     loser_names.push(losers)
            # end
            # p loser_names
        # .map - It iterates through the array and executes the code inside the block. The last line in inside of the block is then pushed into the new varible
        # .map - Can still be used when there isn't a varible attached to the method in this case its names_block
    # .map - Can't use the word return in blocks
            # names = ["Max", "John", "Alex", "Smith"]
            # names_block = names.map do |name| # If you changes .map to .each you will see how the results change.
            #     name + "loser"
            # end
            # p names_block
    # .find - This will loop through the array. When a condition is true it will then stop at that point. It will then put an item into a varible where it stops. 
            # members = ["Alex", "John", "Paul"]

            #     found_member = members.find do |member|
            #         "paul" == member
            #     end

            # p found_member

            # .find - Using it in a method

            # members = []

            # def find_member(name, member)
            #     found_member = members.find do |member|
            #         name == member
            #     end
            #     return found_member
            # end

            # p find_member("paul", members)
    # .select - select will find a number of methods
            # Whatever the .select finds to be true it will push into found_members
            # Select always returns an array
  
            # members = ["Alex", "John", "Paul", "Paul", "oscar"]

            # found_members = members.select do |member|
            #   member.include?("o")
            #  end

            # p found_members
# -- Git --
    # git status - This tells you if you're in a repo
    # git init - This is how you create a git repo. This command is initializing the repository
    # git add . - This means you add everything. The dot means you track / add everything 
    # git commit -m "Message itself" - The dash m stands for message. So git commit -message
    # git log - brings up ever commit that has been made in this directory.
    # git checkout <paste_indentifirer> - If you do git checkout then paste e.g. 1aeb292b68c1669920f5bc0d702ea04add2e256e this is a last commit 
    # git checkout <branch_name> - Goes to a branch name
    # git checkout origin - Checks out and into the origin 

            

