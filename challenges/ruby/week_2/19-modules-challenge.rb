# Creative Source + Code: http://ruby-for-beginners.rubymonstas.org/advanced/modules.html

# 1. Write an attribute accessor to write/set a password. 	# Which one do use?  
	# Read this first: https://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
# 2. Complete the method below. 
	# Return the encrypted password. 
	# Hint: Use the Encryption module method encrypt
# 3. Create an instance of Person and set a password. 
	# Print out the encrypted password. 

require 'digest'
require 'digest/bubblebabble'
require 'base64'
require 'pry'

module Encryption
	def encrypt(string)
		Digest::SHA2.hexdigest(string)
	end

    def babble_this_bubble(string)
		Digest::SHA1.bubblebabble(string)
    end

    def secret_secret(string)
        Base64.encode64(string)
    end
    
    def decode(encrypted_password)
        Base64.decode64(encrypted_password)
    end    
end
  
class Person
	# The Person class has access to the Encryption module with the line below:
	include Encryption
	attr_reader :name
    attr_accessor :password


	def initialize(name)
		@name = name
		@password = ""
	end
	
	def encrypted_password
		@password = encrypt(@password)
	end



	# 4. Finish the method below. 
		# If the user calls reset_password(), ask the user to set a new password
		# Ask them to enter their new password a second time (the confirmation step)
		# If the first entered password does NOT match the second one entered, go back and ask repeatedly for them to set a new password until they do match
        # If they match, encrypt the new password
        # Print a message saying password has been changed
	def reset_password
		puts "Would you like to reset your password? Type yes/no"
		print "> "
		user_input = gets.chomp
		case 
			when user_input == "yes"
				puts "Please type your new password"
				print "> "
				password_reset_input = gets.chomp
				puts "Can you please confirm your password"
				print "> "
				confirm_password = gets.chomp
				if confirm_password == password_reset_input
					@password = encrypt(@password)
					puts "Password has been reset"
				else 
					puts "Your passwords don't match!"
				end
			end
	end

    # 5. Finish the method below.
        # Ask the user if they forgot their password
		# If the user inputs 'Y', run the reset_password() method above
		# If the user inputs 'N', return 
		# If the user inputs anything other than Y or N, ask repeatedly (hint: loop) until they enter Y or N
    def forgot_password
        
    end

    def babble_password
        
    end

    def encode
        
    end

    def nice_try_hacker
        
    end
end

# 6. Once you finish the above methods:
	 # Create another instance of Person and enter the same string password you tried in step 3. 
	 # Do the encrypted passwords match? What could be a possible problem?

# 7. Is there a way to decrypt your encrypted password back to a string? (Hint: search google for MD5 hashes). Type your answer below.
   

# 8. Write a new method inside the Person class called babble_password.
	# Use the Encryption module method babble_this_bubble instead this time. 

# 9. Create a new instance of Person. 
	# Set a password.
	# Use the babble_password method
	# Print out the new encrypted password


# 10. Create a new instance of Person
    # Set a password.
    # Write a method in the Person class called encode
    # Use the secret_secret method for the type of encryption
    # Print out the newly encoded password
    # Now, using the decode method written for you, use the method to decode the encoded password
    # Do you get the same password back in string form? Type your answer below.


# 11. Write a method called nice_try_hacker inside Person that returns the phrase 20 times "how many babbles does it take to bubble a babble back into a bubble?"

# 12. Call the method nice_try_hacker on an instance you created earlier. Print out the result. 

# 13. Get a coffee.

person_one = Person.new("Max")
person_one.password = "Password123"
person_one.encrypted_password
person_one.reset_password
p person_one
