# Faker Gem challenge
# Ask the user to input a Faker.Name method.
# Write a method which does the following...
# 1. Takes the name entered by the user.
# 2. Calls the corresponding Faker.Name method, and returns the result.
# 3. Uses begin/rescue/else to catch errors.
# 4. In the event that an error is raised, print the error message and the phase "Oh no, something went wrong!"
# 5. Returns the result.

require 'faker'

    def name_input()
        loop do
            puts "Randomly generate a name by finishing off this method!"
            print "> "

            begin
        
            user_input = gets.strip.to_sym

            puts Faker::Name.send(user_input)

            rescue => error
                puts "Oh no! Something went wrong"
            end
        end
    end

    name_input()







