# Specs
# This challenge involves creating a Human class with some attributes 
# It also needs to use the shorthand syntax for getter and setter methods (attr_reader, attr_writer, attr_accessor)
# Finally you'll need to use inheritence to create two sub classes (Hippy and Influencer) with their own instance methods
# 1. Create a Human class
# 2. Give the Human class some instance variables; eye_colour, hair_colour, height
# 3. We want to be able to READ eye_colour, hair_colour and height, and WRITE hair_colour
# 4. Create two classes, Hippy and Influencer, that inherit from Human, except an Influencer needs a shower method, whilst the Hippy needs a fire_twirl method

    class Human

        attr_reader :eye_colour
        attr_reader :height
        attr_accessor :hair_colour

        def initialize(eye_colour, hair_colour, height)
            @eye_colour = eye_colour
            @hair_colour = hair_colour
            @height = height
        end
    end


    class Hippy < Human
        def initialize(fire_twirl, eye_colour, hair_colour, height)
            super(eye_colour, hair_colour, height)
            
        end

        def fire_twirl
            puts "Fire twirl"
        end
    end

    class Influencer < Human
        def initialize(eye_colour, hair_colour, height, shower)
            super(eye_colour, hair_colour, height)
            
        end

        def shower
            puts "Have a shower"
        end
    end

