# Specs

# This challenge involves building a car class

# The end product will be a class that has methods to calculate the commute distance for our cars as well as their passenger capacities 

# 1. You'll need the starter code below for the following questions

# class Car
#   def initialize(make, year, mileage)
#       @make = make 
#       @year = year 
#       @mileage = mileage    
#   end

#   def drive(distance)
#       @mileage += distance
#   end

#   def description
#       return "Make: #{@make}, Year: #{@year}, Mileage: #{@mileage}"
#   end
# end

# a. Create a new car named holden with the following values:
# Make: Holden, Year: 2009, Mileage: 3457

# b. In initialize, add a color attribute (parameter and instance variable) and then change the description instance method to include color in the returned string interpolation.

# c. Create a loop to simulate driving to work for a 5 day work week. There should be 10 calls of the drive instance method. The loop should display the commute distance and the current car description.

# 3. Create a new car named weekend_car with the following values:
# Make: Ford, Year: 1965, Mileage: 500045, Color: 'blue'

# 4. Vintage cars are over 30 years old 

# a. Now we know this fact, add an instance method that will check if the car is vintage, call it is_vintage?

# 5. Update description to display vintage status

# 6. Refactor the code so that the loop is moved inside of the class into an instance method called drive_to_work_for_a_week. The method should take one individual commute distance as an argument. The loop should display the commute distance and the current car description.

# 7. Outside of the class, define an array called fleet_cars.

# 8. Add your holden and weekend_car into the fleet_cars array as well as 2 other cars that you'll need to create with .new

# 9. Display the description for each of the cars in the fleet_cars array.

# 10. Define a new instance method named commute_length. This method should ask for what the commute length is for a car instance using gets. It should then add a @commute attribute (instance variable) to the car instance it's called on.

# 11. Call the commute_length instance method on every car in your fleet_cars array using a loop.

# 12. Call the drive_to_work_for_a_week instance method on every car in your fleet_cars array using a loop. You'll no longer need drive_to_work_for_a_week to take a commute argument. Use the instance variable instead.

# 13. Update your drive_to_work_for_a_week method to tell you whether the commute is "going to work" or "going home from work". 

# 14. Add to the Car class a reader method called get_mileage that will return the value of @mileage

# 15. 

# a. Add a data attribute for the number passengers to the Car class. Call it passengers.

# b. Change the initialize method.

# c. Change the description.

# 17. Add to the Car class a getter method called get_passengers that will return the value of @passengers

# 18. Calculate and display the total passenger capacity of the cars in the fleet_cars array

# 19. Create a class method named can_fit_entire_cohort? that will calculate if this total passenger capacity will be able to fit our entire cohort in Melbourne FastTrack. 