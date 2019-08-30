# Specs
# This challenge involves an understanding of how the basics of inheritence works
# It requires you to have one class (Vehicle) which defines some shared behaviour; and our other classes (Car, MotorBike) to implement this behaviour as well as their own unique behaviours
# 1. Implement a Vehicle class. It should accept make and model properties when you create an object.
    # => civic = Vehicle.new("Honda", "Civic")
# 2. Implement a Car class. It should inherit from Vehicle.
    # => civic = Car.new("Honda", "Civic")
# 3. Implement a Motorbike class. It should also inherit from Vehicle.
    # => low_rider = Motorbike.new("Harley Davidson", "Low Rider")
# 4. Implement the following methods, but first, device where they should live.
    # a. refuel (should take one argument: litres)
    # b. wheelie (should display a message)
    # c. wind_up_windows (should display a message)
    # d. fuel_level (should display total litres in the tank)
# 5. A car should only allow maximum 50L of petrol and a bike 15L. Keep your code DRY!
# Hint: research how super works.
# 6. Define a class variable named @@vehicle_counter defined outside the scope of any method, it should store the integer 0
# 7. Everytime a new car is created this class variable should be incremented by 1. Find out the way to do this.
# 8. Define a class method display_number_of_cars that returns this @@vehicle_counter variable to the screen, call this method outside of the class and print the result

class Vehicle

    attr_accessor :make, :model # This is the same as doing the def make @ make end
    attr_reader :fuel_level # This is the same as having the commented code below undder def fuel_level

    @@vehicle_counter = 0

    def initialize(make, model)
        @make = make
        @model = model
    end

    def refuel(litres)
        @refuel = litres
        if self.fuel_level < litres
            puts "Over limit! Limit is #{fuel_level}"
        else
            puts "Your #{make} has been refueled with #{@refuel}L"
        end
    end

    def vehicle_counter
        @@vehicle_counter
    end

    # def fuel_level
    #     @fuel_level 
    # end
end

class Car < Vehicle

    @@car_counter = 0
    
    def initialize(make, model)
        super(make, model)  
        @fuel_level = 50
        @@vehicle_counter += 1
        @@car_counter += 1
    end

    def wind_up_windows
        puts "Windows are now up!"
    end

    def car_counter
        @@car_counter
    end
end

class Motorbike < Vehicle

    @@bike_counter = 0
    
    def initialize(make, model)
        super(make, model)
        @fuel_level = 15
        @@vehicle_counter += 1
        @@bike_counter += 1
    end

    def bike_counter
        @@bike_counter
    end

    def wheelie
        puts "Wheelieeeee!!"
    end
end

sports_car = Car.new("Porche", "sport")
sports_car.refuel(50)

low_rider = Motorbike.new("Harley Davidson", "Low Rider")
low_rider.refuel(5)
display_total_vehicles = sports_car.vehicle_counter
display_number_of_cars = sports_car.car_counter
display_number_of_bikes = low_rider.bike_counter

p low_rider
p sports_car
p display_number_of_cars
p display_number_of_bikes
p display_total_vehicles