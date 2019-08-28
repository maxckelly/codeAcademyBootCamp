# 23.
# Contacts Terminal

# Your challenge is to create a terminal app that has similar functionality to the contacts app on your phones

# Specifications

# a. Let users go to a menu that has 4 different options: view contacts, add contacts, remove contacts and exit. This will require the use of some kind of loop. The loop keeps running until the user selects exit from the menu. Think about how the user will select which action they want to perform. Maybe using an integer to select actions is the best option?

# The code for printing your menu will look something like this

contacts = [
  {
    name: "Test",
    number: 043223,
    location: "test location"
  },
  {
    name: "Another Test",
    number: 043223,
    location: "test location"
  }
]


def mobile_contacts(contacts)

  loop do

    puts "Please select one of the following options:"
    puts "1. View Contacts"
    puts "2. Add Contacts"
    puts "3. Remove Contacts"
    puts "4. Exit"
    print "> "


    user_input = gets.chomp

    case user_input
        
      when "View Contacts", "1"

        system("clear")
        puts contacts
        puts "---------------"
      when "Add Contacts", "2"

        p "What is the persons name?"
        print "> "
        user_name = gets.chomp

        p "What is the persons number?"
        print "> "
        user_number = gets.to_i

        p "What is the persons address?"
        print "> "
        user_location = gets.chomp

        user = {
          name: user_name,
          number: user_number,
          location: user_location
        }

        puts contacts.push(user)

      when "Remove Contacts", "3"

        p "Please type the name you would like to remove or cancel to cancel your request"
        p contacts
        print "> "
        user_remove = gets.chomp

        contacts.each do |contact|  # This goes through the contacts array - There is an end to this method.
          if (contact[:name] == user_remove)
            puts "Are you sure you want to delete this contact?"
            confirm = gets.chomp
            if confirm.downcase == "yes"
              index = contacts.index(contact)
              contacts.delete_at(index)
              puts "Contact has been deleted"
            end
            else 
              puts "Contact has not been deleted"
          end
        end
      when "Exit", "4"
        break
      else
        # put other inputs here
      end
  end
end

mobile_contacts(contacts)