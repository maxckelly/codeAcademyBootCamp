# Basic classes

# 1. Define a cat class and inside the class define an empty initialize method
# 2. In the initialize method, pass in the name of the cat as a parameter
# 3. In the initialize method, declare an @name instance variable and assign it the value of the name parameter
# 4. Make 3 cat objects using the .new method, an example:
# 5. Implement a speak method to make a car say "meow"
# 6. Add each cat's name to the speak method
# -- Intermediate classes --         
# 1. Using the cat class as a starting point, make a dog class with the exact same instance variables and methods as what we had in the cat class, change the speak sound from "meoww" to "woof"
# 2. Let's change initialize slightly, add an age parameter and declare an @age instance variable, assign it the value of the age parameter 
# 3. In the initialize method on the last line, add a p "#{@name} has been initialized!" to visually see every time the initialize method runs
# 4. Change the speak method to puts "<the name of the dog> says woof! I am <the dogs age> years old"
# 5. Make 3 dog objects using the .new method, make them all speak
# 6. We've got name and age, let's give each dog a location too. Test your location works by printing the dog's location using an attribute reader. Edit the dogs you created with .new by including the location now.
# 7. Create a walk method. This should say "I have been for X walks.". Every time you call walk, the number should increase by one E.g:
    # doggo = Dog.new(...)
    # doggo.walk # -> I have been for 1 walks today
    # doggo.walk # -> I have been for 2 walks today
    # Think about the place where you store the total walks for the day. Ask if you need help 😀.
# 8. Update the walk method so it only increases the walk count. Create a new method to display walks. 
    # Example
    # doggo.walk # -> Shouldn't print anything on screen
    # doggo.walk # -> Shouldn't print anything on screen
    # doggo.display_walks # -> I have been for 2 walks today
# 9. Update the walk method so you can chain walk commans. 
    # Example
    # doggo.walk.walk.display_walks # -> I have been for 2 walks today
# 10. Update your your original dogs (where you used .new) to now not include the original location string. 
# 11. Improve the walk method. Make it accept a location and a distance. Think about the data structure you can use to store multiple walks. You will need to change initialize. 
    # Example
    # doggo.walk('Brisbane', 20)
# 12. Update your display_walks method to show all of the walk details.

class Cat
    def initialize(cat_name, speak)
        @cat_name = cat_name
        @speak = speak
    end

    def cat_name
        @cat_name
    end

    def speak
        @speak
    end
end

# cat_creation = Cat.new("Max the Cat", "goes meow")
# puts cat_creation.cat_name + " " + cat_creation.speak


class Dog

    attr_reader :location_start, :location_stop
    attr_accessor :dog_name, :age, :location_start, :location_stop

    def initialize(dog_name, age)
        @dog_name = dog_name
        @age = age
        @walks = 0 # Classes can have its own values without arguements. This stores the walks
        @location_start = ""
        @location_stop = ""
        @distance = 0
        @total_distance = 0
    end

    def walk(location_start, location_stop, distance)
        @location_start=location_start
        @location_stop=location_stop
        @distance=distance
    end

    def total_distance()
        
    end
    def walks()
        @walks += 1

        self # This allows to chain onto other calls for example doggo.walks.walks.display_walks - This is called chaining
    end

    def display_walks()
        puts "I've been on #{@walks} walks today such as #{@location_start} to #{@location_stop} which was a total distance of #{@distance} "
        
    end

    def speak()
        puts "#{@dog_name} says woof! I am #{@age} years old and I live at "
    end
end

dog_1 = Dog.new("Max", 21) # This initilizes the class allowing you to access its data from dog_1
doggo = Dog.new("Max", 21)
puts doggo.walk('Hawthorn', "St Kilda", 20)
doggo.walks.walks.walks.display_walks




# 13. Implement a total_distance method to calculate the total distance of all the walks.

# 14. Track the time each walk is created. Update display_walks to show it back to your user in a readable format.

# Optional

# 14. Research ruby gems. Use a gem to geocode a location and store it's latitude + longitude. E.g. "Brisbane" stores -27.44888,153.00531