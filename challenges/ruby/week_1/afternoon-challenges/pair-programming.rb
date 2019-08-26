# 23.
# Contacts Terminal

# Your challenge is to create a terminal app that has similar functionality to the contacts app on your phones

# Specifications

# a. Let users go to a menu that has 4 different options: view contacts, add contacts, remove contacts and exit. This will require the use of some kind of loop. The loop keeps running until the user selects exit from the menu. Think about how the user will select which action they want to perform. Maybe using an integer to select actions is the best option?

# The code for printing your menu will look something like this

contacts = [
  {
    name: "Test",
    number: 043223
  }
]


def mobile_contacts(contacts)

  puts "Please select one of the following options:"
  puts "1. View Contacts"
  puts "2. Add Contacts"
  puts "3. Remove Contacts"
  puts "4. Exit"
  print "> "


  user_input = gets.chomp


  case user_input
    when "View Contacts", "1"
      return contacts
    when "Add Contacts", "2"
      p "What is the persons name?"
      print "> "
      user_name = gets.chomp
      user_number = gets.to_i

      user = {
        name: user_name,
        number: user_number
      }
      contacts.push(user)
  end
end

puts mobile_contacts(contacts)

# b. View contacts should show all entries in a format similar to the below

# ---------------------------------------
# Harrison Malone +6123445468
# Educator at Coder Academy
# 120 Spencer Street, Melbourne
# ---------------------------------------
# Aaron Mendosa +6100000001
# Educator at Coder Academy
# 120 Spencer Street, Melbourne
# ---------------------------------------

# c. Add should provide prompts for each property of the entry like what is the name? ___ and what is the number? ___

# d. Remove should ask for a name, and if that name is in the phone book then ask the user to confirm the removal. Only remove the entry once the user confirms that they want to remove it!