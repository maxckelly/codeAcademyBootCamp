# -- Arrays --
    # array = [0, 1, "Max", true, 4]
    p a = ["a", "b", "c"]
    # The first item in an array is always numbered 0
    # You can add a method to an array by the below - find more methods here: https://docs.ruby-lang.org/en/2.0.0/Array.html
        # array.capitalize, 
        # array.last - prints the last array (ruby only)
        # puts array.first - prints the fisrt array (ruby only)
        # array.inset(2, "Max") - The two at the start says it will select the second item in the array and place that there. 
        # p a.empty? - prints either true or false
        # array.push(enter value) - This pushes something to an array
            p a.push("d") # This will push to the end of the array
            # Another way to push it is: 
                p a << "e"
        # array.pop - This removes an item from an array. It only removes the last item
            a.pop 
            p a
        # array.shift - This removes an item from an array. It only removes the first item
            a.shift
            p a
        # array.unshift - To add an item to the front of the list 
            a.unshift
            p a

# -- Loops --
    # A loop is something that repeats
    # While loops are very universal - find it in java, python etc... 
    # Until loop is found mainly in Ruby
    # For loop is found everywhere
        # An example of a simple loop
            #loop do
                #puts "This will keep printing until you hit Ctrl + C"
            #end

            # i = 0
            #loop do
                # i = i + 1
                # puts i 
            #end
    # while loops, until loops, do/while loops, for loops, conditional loop - These are all the loops
    # while loop
        # p "Enter a number"
        # i = gets.chomp.to_i
        # while x >= 0
        #     puts x
        #     x = x - 1
        # end
        # puts "Done!"
    # Conditional loop 
        # i = 0 
        # loop do
        #     i = i + 2 
        #     puts i 
        #     if i == 10
        #         break
        #     end
        # end
    # Until loop 
        # p "Enter a number"
        # x = gets.chomp.to_i
        # until x < 0
        #     puts x
        #     x = x - 1
        # end
        # puts "Done!"
    # For loop

        # p "Enter a number"
        # x = gets.chomp.to_i
        # for i in 1..x do
        #     puts i 
        # end

        # list_of_students = ["a", "b", "c"]

        # for person in list_of_students
        #     puts "Hello #{person}"
        # end

        # puts "Done!"
        